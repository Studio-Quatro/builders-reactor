# frozen_string_literal: true

CREDENTIALS = Rails.application.credentials.buildxact
module Buildxact
  # Class to connect to Buildxac website.
  # You can build a connection using something like these:
  #   buildxact_connection = Buildxact::Connect.call
  class TokenObtainer < ApplicationService
    def initialize(params = {})
      super()
      @params = params
      @params[:domain] ||= CREDENTIALS.domain
      @params[:username] ||= CREDENTIALS.username
      @params[:password] ||= CREDENTIALS.password
      @params[:client_id] ||= CREDENTIALS.client_id
      @params[:client_secret] ||= CREDENTIALS.client_secret
      @params[:grant_type] ||= CREDENTIALS.grant_type
    end

    def call
      obtain_token
    end

    def obtain_token
      response = HTTParty.post(
        "#{@params[:domain]}/oauth/token",
        body: {
          username: @params[:username],
          password: @params[:password],
          client_id: @params[:client_id],
          client_secret: @params[:client_secret],
          grant_type: @params[:grant_type]
        }
      )
      response.parsed_response['access_token']
    end
  end
end
