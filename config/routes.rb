# frozen_string_literal: true

Rails.application.routes.draw do
  get 'categories/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "main#index"
  get 'build_product_list', to: 'main#build_product_list'
  get 'build_category_list', to: 'main#build_category_list'

  get 'build_item_list_from_bxa', to: 'main#build_item_list_from_bxa'
  
  resources :products, only: [:index]
  resources :categories, only: [:index]
  namespace :buildxact do
    resources :items, only: [:index]
  end
end
