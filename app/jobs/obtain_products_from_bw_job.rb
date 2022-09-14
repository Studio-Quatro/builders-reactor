# frozen_string_literal: true

class ObtainProductsFromBwJob < ApplicationJob
  queue_as :default

  def perform(*args)
    DownloadProductsListUseCase.new.call
  end
end
