# frozen_string_literal: true

# Main controller
class MainController < ApplicationController
  def index
    @last_products_update = Setting.last_products_update
    @last_categories_update = Setting.last_categories_update
  end

  # Enqueue a job to download products from WooCommerce
  def build_product_list
    DownloadProductsListUseCase.new.call
  end

  # Enqueue a job to download product categories from WooCommerce
  def build_category_list
    BuildersWorld::CategoriesDownloader.call({connection: BuildersWorld::Connect.call})
  end

end
