# frozen_string_literal: true

class ObtainProductsFromBxaJob < ApplicationJob
  queue_as :default

  def perform
    DownloadDataFromCatalogueUseCase.call
  end
end
