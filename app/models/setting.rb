# RailsSettings Model
class Setting < RailsSettings::Base
  cache_prefix { 'v1' }
  field :bxa_token
  field :last_categories_update
  field :last_products_update
  field :last_bxa_products_update
  field :last_bxa_categories_update
  field :last_products_comparison
end
