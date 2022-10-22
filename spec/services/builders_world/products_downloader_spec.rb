# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(BuildersWorld::ProductsDownloader, type: :service) do
  describe '#call', :vcr do
    context 'when the parameters are correct' do
      it 'returns a list of products' do
        connection = BuildersWorld::Connect.call
        expect(described_class.call({ connection: }).class).to eq(Array)
      end
    end

    context 'when missing parameters'
    context 'when raise an error'
  end
end
