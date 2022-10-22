# frozen_string_literal: true

module Resources
  module Buildxact
    class Catalogue < ActiveResource::Base
      self.site = 'https://api.buildxact.com/rest'
      self.bearer_token = ENV.fetch('BUILDXACT_API_KEY', nil)
    end
  end
end
