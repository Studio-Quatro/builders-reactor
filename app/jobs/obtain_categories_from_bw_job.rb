# frozen_string_literal: true

class ObtainCategoriesFromBwJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    BuildersWorld::CategoriesDownloader.call({connection: BuildersWorld::Connect.call})
  end
end

