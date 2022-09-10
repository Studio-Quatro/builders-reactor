# frozen_string_literal: true

module BuildersWorld
  # Replace this line with documentation for this service.
  # @param [Hash] params
  # @option params [WooCommerce object] :connection WooCommerce object.
  class ProductsDownloader < ApplicationService
    def initialize(params)
      super()
      @website = params[:connection]
      @products_list = []
    end

    # @return List of products or raise an error.
    def call
      build_list_of_products
      map_products
      update_products

      {
        'status': 'success',
        'message': 'Products updated successfully.'
      }
    end

    private

    def map_products
      @mapped_products =
        @products_list.map do |product|
          {
            external_id: product.dig('id'),
            description: product.dig('name') || '',
            category: product.dig('categories')[-2].dig('id') || product.dig('categories')[-1].dig('id') || '',
            sub_category: product.dig('categories')[-1].dig('id') || '',
            image_url: product.dig('images',0,'src') || '',
            unit_cost: product.dig('regular_price') || 0,
            #uom: 'Each',
            supplier_code: product.dig('sku') || '',
            is_recipe: false,
            cost_item_type: 'Item',
            # catalogue_category_id: find_map product['categories'][-2]['id'],
            # catalogue_sub_category_id: find_map product['categories'][-1]['id']
          }
        end
    end

    def update_products
      Item.upsert_all(@mapped_products.uniq, unique_by: :external_id)
    end

    def get_products_from_page(page)
      @website.get("products?per_page=99&page=#{page}").parsed_response
    end

    def build_list_of_products
      current_page = 1
      loop do
        current_products_page = get_products_from_page(current_page)
        @products_list += current_products_page
        break if current_products_page.empty?

        Rails.logger.debug { "Downloading from page #{current_page}." }
        current_page += 1
      end
    end
  end
end
