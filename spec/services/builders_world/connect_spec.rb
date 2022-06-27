# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(BuildersWorld::Connect, type: :service) do
  context 'when connection was succesful' do
    it 'returns a Woocommerce object' do
      test_connection_params = { domain: 'http://test.com', consumer_key: 'some_key', consumer_secret: 'some_secret' }
      connection = described_class.new(test_connection_params).call
      expect(connection.instance_of?(WooCommerce::API)).to be(true)
    end
  end
end
