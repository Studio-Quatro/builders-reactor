# frozen_string_literal: true

module Buildxact
  class Categories < ApplicationService
    def initialize(params)
      @access_token = params[:access_token]
      @catalogue_id = params[:catalogue_id]
      @from = params[:from]
      @to = params[:to]
    end

    def call
      get_categories
    end

    private

    attr_reader :access_token, :catalogue_id, :from, :to

    def get_categories
      url = 'https://api.buildxact.com/rest/catalogues/categories?'
      url += "catalogueId=#{catalogue_id}"
      response = HTTParty.get(url, headers: { 'Authorization' => "Bearer #{access_token}" })
      response.parsed_response
    end

    def response
      # TODO: implement
    end
  end
end
