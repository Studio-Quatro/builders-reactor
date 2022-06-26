# frozen_string_literal: true

require 'woocommerce_api'

CREDENTIALS = Rails.application.credentials.woocommerce

module BuildersWorld
  # Class to connect Woocommerce shop from BuildersWorld website
  class Connect
    def call
      woocommerce = WooCommerce::API.new(
        CREDENTIALS.domain,
        CREDENTIALS.consumer_key,
        CREDENTIALS.consumer_secret,
        {
          wp_api: true,
          version: 'wc/v1'
        }
      )
      Rails.logger.debug(woocommerce)
    end
  end
end
