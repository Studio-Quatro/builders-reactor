# frozen_string_literal: true

Rails.application.routes.draw do
  get 'categories/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "main#index"
  get 'build_product_list', to: 'main#build_product_list'
  get 'build_category_list', to: 'main#build_category_list'
  get 'download_products_list', to: 'main#download_products_list'

  get 'build_item_list_from_bxa', to: 'main#build_item_list_from_bxa'
  get 'download_products_list_from_bxa', to: 'main#download_products_list_from_bxa'
  
  resources :products, only: [:index]
  resources :categories, only: [:index]
end
