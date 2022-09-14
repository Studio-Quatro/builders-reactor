# frozen_string_literal: true

require 'woocommerce_api'
WC_CREDENTIALS = Rails.application.credentials.woocommerce
module BuildersWorld
  # Class to connect Woocommerce shop from BuildersWorld website
  # You could build a connection using something like these:
  #   builders_world_website = BuildersWorld::Connect.call
  class Connect < ApplicationService
    def initialize(params = {})
      super()
      @params = params
      @params[:domain] ||= WC_CREDENTIALS.domain
      @params[:consumer_key] ||= WC_CREDENTIALS.consumer_key
      @params[:consumer_secret] ||= WC_CREDENTIALS.consumer_secret
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
    end
  end
end
