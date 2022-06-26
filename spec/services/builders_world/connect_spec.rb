# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(BuildersWorld::Connect, type: :service) do
  context 'when connection was succesful' do
    it 'returns a Woocommerce object'
  end

  context 'when connection fails' do
    it 'raises an error / returns something'
  end
end
