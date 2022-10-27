# frozen_string_literal: true

module Buildxact
  class ItemUpdater < ApplicationService
    def initialize(params)
      @access_token = params[:access_token]
      @catalogue_id = params[:catalogue_id]
      @bw_item = params[:bw_item]
      @bxa_item = params[:bxa_item]
    end

    def call

      update_item
    end

    private

    attr_reader :access_token, :catalogue_id, :from, :to

    def update_item
      url = "https://api.buildxact.com/rest/catalogues/#{catalogue_id}/items/#{catalogueItemId}"
      response = HTTParty.patch(url, headers: { 'Authorization' => "Bearer #{access_token}" }, body: )
      response.parsed_response
    end

    def body
      # Pending
      # @bw_item -> @bxa_item
    end

