# frozen_string_literal: true

require './lib/utils/file_persistor'
# This use case download products from BuildersWorld website ApplicationRecord
#   and saves a file ready to parse and persist on database.
class DownloadProductsListUseCase < ApplicationUseCase
  # @return Hash with info of file.
  def call
    start_timer
    connect_with_webpage
    retrieve_products
    #save_temp_file
    response
  end

  private

  def start_timer
    @start_time = now
  end

  def now
    Time.zone.now
  end

  def connect_with_webpage
    @connection = BuildersWorld::Connect.call
  end

  def retrieve_products
    @products_list = BuildersWorld::ProductsDownloader.call({ connection: @connection })
  end

  #def save_temp_file
    #@file_size = Utils::FilePersistor.new.save('builders_products_list', @products_list)
  #end

  def response
    {
      #file_size: @file_size,
      #file_path: '/tmp/builders_products_list',
      date: now,
      elapsed_time: now - @start_time
    }
  end
end
