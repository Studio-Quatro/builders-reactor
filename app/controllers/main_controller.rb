# frozen_string_literal: true

# Main controller
class MainController < ApplicationController
  def index; end

  # Enqueue a job to download products from WooCommerce
  def build_product_list
    DownloadProductsListUseCase.new.call
  end

  # Enqueue a job to download product categories from WooCommerce
  def build_category_list
    DownloadCategoriesListUseCase.new.call
  end

  end
