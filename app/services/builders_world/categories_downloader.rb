# frozen_string_literal: true

module BuildersWorld
  # Replace this line with documentation for this service.
  # @param [Hash] params
  # @option params [WooCommerce object] :connection WooCommerce object.
  class CategoriesDownloader < ApplicationService
    def initialize(params)
      super()
      @website = params[:connection]
      @categories_list = []
    end

    # @return List of products or raise an error.
    def call
      build_list_of_categories
      map_categories
      update_categories

      "{
        'categories': #{@categories_list.count},
        'status': 'success'
}"
    end

    private

    def update_categories
      Category.upsert_all(@mapped_categories, unique_by: :wc_id)
    end

    def map_categories
      @mapped_categories =
        @categories_list.map do |category|
          {
            wc_id: category['id'].to_i,
            slug: category['slug'].to_s,
            name: category['name'].to_s,
            parent_id: category['parent'].to_i
          }
        end
    end

    def get_categories_from_page(page)
      @website.get("products/categories?per_page=99&page=#{page}").parsed_response
    end

    def build_list_of_categories
      current_page = 1
      loop do
        current_categories_page = get_categories_from_page(current_page)
        break if current_categories_page.empty?

        @categories_list += current_categories_page
        Rails.logger.debug { "Downloading from page #{current_page}." }
        current_page += 1
      end
    end
  end
end
