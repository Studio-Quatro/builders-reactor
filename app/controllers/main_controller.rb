# frozen_string_literal: true

# Main controller
class MainController < ApplicationController
  def index; end

  # TODO: Delete endpoint. Only for development purposes.
  def build_product_list
    @response = DownloadProductsListUseCase.new.call
  end

  def download_products_list
    render(plain: Rails.root.join('tmp/builders_products_list').open.read)
  end
end
