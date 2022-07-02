# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'bootsnap', require: false
gem 'sprockets-rails'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'jbuilder'
gem 'rails', '~> 7.0.3'
gem 'redis', '~> 4.0'
gem 'stimulus-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'tailwindcss-rails', '~> 2.0'
gem 'woocommerce_api'

group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'rubocop-discourse'
  gem 'rubocop-rails'
  gem 'rubocop-rails_config'
  gem 'byebug'
  gem 'pry'
  gem 'vcr'
  gem 'webmock'
  gem 'guard'
end

group :test do
    gem "nyan-cat-formatter"
end
