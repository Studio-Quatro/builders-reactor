# frozen_string_literal: true

class DownloadDataFromCategoriesUseCase < ApplicationUseCase
  def call
    start_time
    get_access_token
    get_catalogue_info
    get_categories
    update_categories
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

  def get_categories
    @categories= Buildxact::Categories.call(
      {
        access_token: @access_token,
        catalogue_id: @catalogue_id,
      }
    )
  end

  def mapped_categories
    @categories.map do |category|
      {
        name: category['category'],
        updated_at: @start_time,
        created_at: @start_time,
        category_id: category['categoryId'],
        subcategory: category['subCategory'],
        subcategory_id: category['subCategoryId'],
        item_count: category['itemCount']
      }
    end
  end

  def update_categories
    Buildxact::Category.upsert_all(mapped_categories.uniq, unique_by: :subcategory_id)
  end

  def elapsed_time
    Time.now - @start_time
  end

  def update_date_on_settings
    Setting.last_bxa_categories_update = Time.now
  end

  def response
    {
      elapsed_time: elapsed_time,
      catalogue_items: @categories.count
    }
  end
end
