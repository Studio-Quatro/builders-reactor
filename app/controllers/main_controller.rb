# frozen_string_literal: true

# Main controller
class MainController < ApplicationController
  def index
    @last_products_update = Setting.last_products_update
    @last_categories_update = Setting.last_categories_update
  end

  # Enqueue ObtainProductsFromBwJob and respond with a message
  def build_product_list
    ObtainProductsFromBwJob.perform_later
    render json: { message: 'Product list is being built. This process could take some time... Please, do not retry the action.' }
  end

  # Enqueue a job to download product categories from WooCommerce
  def build_category_list
    ObtainCategoriesFromBwJob.perform_later
    render json: { message: 'Categories list is being built. This process could take some time... Please, do not retry the action.' }
  end

  def build_item_list_from_bxa
    ObtainProductsFromBxaJob.perform_later
    render json: { message: 'Product list is being built. This process could take some time... Please, do not retry the action.' }
  end

end
