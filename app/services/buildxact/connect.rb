# frozen_string_literal: true

CREDENTIALS = Rails.application.credentials.buildxact
module Buildxact 
  # Class to connect to Buildxac website.
  # You can build a connection using something like these:
  #   buildxact_connection = Buildxact::Connect.call
  class Connect < ApplicationService
    def initialize(params = {})
      super()
      @params = params
      @params[:domain] ||= CREDENTIALS.domain
      @params[:consumer_key] ||= CREDENTIALS.consumer_key
      @params[:consumer_secret] ||= CREDENTIALS.consumer_secret
    end

    def call
      obtain_token
    end
  end
end
