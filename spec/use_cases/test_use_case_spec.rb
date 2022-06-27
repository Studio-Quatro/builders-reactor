# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(TestUseCase, type: :use_case) do
  describe '#call' do
    context 'when the parameters are correct' do
      let(:params) { '{}' }
      let(:result) { described_class.call(params) }

      it 'returns a Struct with success response' do
        expect(result).to have_attributes(success?: true, payload: a_kind_of(String), error: nil)
      end

      it 'returns a Struct with ...' do
        expect(result.payload).to include
        # expected_response
      end
    end

    context 'when missing parameters' do
      it 'returns a response with an error' do
        result = described_class.call({})

        expect(result).to have_attributes(success?: false, error: a_kind_of(StandardError))
        expect(result.error.message).to eq('ArgumentError')
      end
    end

    context 'when raise an error' do
      it 'returns a response with an error' do
        result = described_class.call(params)

        expect(result).to have_attributes(success?: false, error: a_kind_of(StandardError))
        expect(result.error.message).to eq('Storages::FileUploaderUtil')
      end
    end
  end
end