# frozen_string_literal: true

require './lib/utils/file_persistor'

class DownloadDataFromCatalogueUseCase < ApplicationUseCase
  def call
    start_time
    get_access_token
    get_catalogue_info
    get_all_catalogue_items
    #save_temp_file
    update_catalogue_items
    update_date_on_settings

    response
  end

  private

  def start_time
    @start_time = Time.now
  end

  def get_access_token
    @access_token = Buildxact::TokenObtainer.call
  end

  def get_catalogue_info
    @catalogue_id = Rails.application.credentials.dig(:buildxact, :catalogue_id)
  end

  def get_all_catalogue_items
    @catalogue_items = []
    page = 0
    loop do
      first_item = page * 100
      last_item = first_item + 99
      current_page = get_catalogue_items(first_item, last_item)['items']
      @catalogue_items.concat(current_page)
      puts "Page #{page} done. From #{first_item} to #{last_item}. Total #{@catalogue_items.count}"
      break if current_page.count < 100

      page += 1
    end
  end

  def get_catalogue_items(from, to)
    @all_catalogue_items = Buildxact::CatalogueItems.call(
      {
        access_token: @access_token,
        catalogue_id: @catalogue_id,
        from:,
        to:
      }
    )
  end

  def mapped_catalogue_items
    @catalogue_items.map do |item|
      {
        bxa_id: item['id'],
        description: item['description'],
        unit_cost: item['unitCost'].to_f,
        catalogue_description: item['catalogueDescription'],
        category: item['category'],
        cost_item_type: item['costItemType'],
        catalogue_id: item['catalogueId'],
        catalogue_category_id: item['catalogueCategoryId'],
        catalogue_sub_category_id: item['catalogueSubCategoryId'],
        image_url: item['imageUrl'],
        is_recipe: item['isRecipe'],
        sub_category: item['subCategory'],
        supplier_code: item['supplierCode'],
        uom: item['uom'],
      }
    end
  end

  def update_catalogue_items
    Buildxact::Item.upsert_all(mapped_catalogue_items.uniq, unique_by: :bxa_id)
  end

  #def save_temp_file
    #@file_size = Utils::FilePersistor.new.save('buildxact_catalogue', @all_catalogue_items)
  #end

  def elapsed_time
    @elapsed_time = Time.now - @start_time
  end

  def update_date_on_settings
    Setting.update('last_bxa_products_update', Time.now)
  end

  def response
    {
      #file_size: @file_size,
      elapsed_time: @elapsed_time,
      catalogue_items: @catalogue_items.count
    }
  end
end
