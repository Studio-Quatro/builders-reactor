# frozen_string_literal: true

require 'woocommerce_api'
CREDENTIALS = Rails.application.credentials.woocommerce
module BuildersWorld
  # Class to connect Woocommerce shop from BuildersWorld website
  # You could build a connection using something like these:
  #   builders_world_website = BuildersWorld::Connect.new.call
  class Connect
    def initialize(params)
      @params = params
      @params[:domain] ||= CREDENTIALS.domain
      @params[:consumer_key] ||= CREDENTIALS.consumer_key
      @params[:consumer_secret] ||= CREDENTIALS.consumer_secret
    end

    def call
      @connector = WooCommerce::API.new(
        @params[:domain],
        @params[:consumer_key],
        @params[:consumer_secret],
        {
          wp_api: true,
          version: 'wc/v1'
        }
      )
      # Rails.logger.debug(woocommerce)
      # woocommerce.get("products/categories").parsed_response
      # woocommerce.get('products?per_page=99&page=1').parsed_response
      # woocommerce.get('products?per_page=99&page=2').parsed_response
      # woocommerce.get('products?per_page=99&page=3').parsed_response
      # woocommerce.get('products?per_page=99&page=4').parsed_response
      # Until response == []
    end
  end
end
