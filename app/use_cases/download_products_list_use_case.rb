# frozen_string_literal: true

require './lib/utils/file_persistor'
# This use case download products from BuildersWorld website ApplicationRecord
#   and saves a file ready to parse and persist on database.
class DownloadProductsListUseCase < ApplicationUseCase
  # @return Hash with info of file.
  def call
    @start_time = Time.zone.now
    connect_with_webpage
    retrieve_products
    save_temp_file
    response
  end

  private

  def connect_with_webpage
    @connection = BuildersWorld::Connect.call
  end

  def retrieve_products
    @products_list = BuildersWorld::ProductsDownloader.call({ connection: @connection })
  end

  def save_temp_file
    @path = Rails.root.join('tmp', 'builders_products_list')
    @file_size = Utils::FilePersistor.new.save(@path, @products_list)
  end

  def response
    {
      file_size: @file_size,
      file_path: @path,
      date: Time.zone.now,
      elapsed_time: Time.zone.now - @start_time
    }
  end
end
