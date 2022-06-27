# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(BuildersWorld::ProductsDownloader, type: :service) do
  describe '#call' do
    context 'when the parameters are correct' do
      xit 'returns a list of products' do
        expect(described_class.call.class).to eq(Array)
      end
    end

    context 'when missing parameters'
    context 'when raise an error'
  end
end
