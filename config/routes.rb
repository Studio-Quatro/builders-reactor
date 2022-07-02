# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "main#index"
  get 'build_product_list', to: 'main#build_product_list'
  get 'download_products_list', to: 'main#download_products_list'
end
