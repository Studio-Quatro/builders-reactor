# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(DownloadProductsListUseCase, type: :use_case) do
  describe '#call', :vcr do
    context 'when connection was successful' do
      let(:result) { described_class.call }

      it 'returns a hash with success response' do
        expect(result[:file_size].class).to eq(Integer)
        expect(result[:file_size].class).to eq(Integer)
      end
    end

    context 'when connection with BuildersWorld failed' do
      it 'raises an error' do
        expect { described_class.call }.to raise_error()
      end
    end
  end
end
