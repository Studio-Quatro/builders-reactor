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
      @products_list
    end

    private

    def get_products_from_page(page)
      @website.get("products?per_page=99&page=#{page}").parsed_response
    end

    def build_list_of_products
      current_page = 1
      loop do
        current_products_page = get_products_from_page(current_page)
        @products_list << current_products_page
        break if current_products_page.empty?

        Rails.logger.debug { "Downloading from page #{current_page}." }
        current_page += 1
      end
    end
  end
end
