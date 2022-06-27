# frozen_string_literal: true

# Main controller
class MainController < ApplicationController
  def index; end

  # TODO: Delete endpoint. Only for development purposes.
  def products
    @products_list = DownloadProductsListUseCase.new.call
  end
end
