# frozen_string_literal: true

module Resources
  module Buildxact
    class Catalogue < ActiveResource::Base
      self.site = 'https://api.buildxact.com/rest'
      self.bearer_token = ENV['BUILDXACT_API_KEY']
    end
  end
end
