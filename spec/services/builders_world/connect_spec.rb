# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(BuildersWorld::Connect, type: :service) do
  context 'when connection was succesful' do
    it 'returns a Woocommerce object' do
      connection = described_class.new.call
      expect(connection.instance_of?(WooCommerce::API)).to be(true)
    end
  end
end
