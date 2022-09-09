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
      binding.pry
      build_list_of_products
      map_products
      update_products

      "{
      'status': 'success',
      'message': 'Products updated successfully.'
}"
    end

    private

    def map_products
      @mapped_products = @products_list.map do |product|
        {
          external_id: product['id'],
          description: product['name'],
          category: product['categories'][-2]['id'],
          sub_category: product['categories'][-1]['id'],
          image_url: product['images'][0]['src'],
          unit_cost: product['regular_price'],
          uom: 'Each',
          supplier_code: product['sku'],
          is_recipe: false,
          cost_item_type: 'Item',
          #catalogue_category_id: find_map product['categories'][-2]['id'],
          #catalogue_sub_category_id: find_map product['categories'][-1]['id']
        }
      end
    end

    def update_products
      Item.upsert_all(@mapped_products, unique_by: :external_id)
    end

    def get_products_from_page(page)
      #@website.get("products?per_page=99&page=#{page}").parsed_response

      @website.get("products?per_page=2&page=#{page}").parsed_response # Delete
    end

    def build_list_of_products
      current_page = 1
      loop do
        current_products_page = get_products_from_page(current_page)
        @products_list += current_products_page
        break if current_products_page.empty?

        Rails.logger.debug { "Downloading from page #{current_page}." }
        #current_page += 1
        current_page += 10000 # Delete
      end
    end
  end
end
