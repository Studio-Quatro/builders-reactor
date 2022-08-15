# frozen_string_literal: true

module Buildxact
  class CatalogueItems < ApplicationService
    def initialize(params)
      @access_token = params[:access_token]
      @catalogue_id = params[:catalogue_id]
      @from = params[:from]
      @to = params[:to]
    end

    def call
      get_catalogue_items
    end

    private

    attr_reader :access_token, :catalogue_id, :from, :to

    def get_catalogue_items
      url = "https://api.buildxact.com/rest/catalogues/items/search?"
      url += "catalogueIds=#{ catalogue_id }&"
      url += "skip=#{ from }&"
      url += "top=100#{ to }"
      response = HTTParty.get(url, headers: { "Authorization" => "Bearer #{ access_token }" })
      response.parsed_response
    end

    def response
      # TODO: implement
    end
  end
end
