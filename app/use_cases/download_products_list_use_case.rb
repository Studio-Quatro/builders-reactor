# frozen_string_literal: true

# Replace this line with documentation for this use case.
# @param [Hash] params
# @option params [Type] :name_of_param Description of param.
class DownloadProductsListUseCase
  # @return Replace with return.
  def call
    connect_with_webpage
    retrieve_products
    # save_temp_file
  end

  private 
  
  def connect_with_webpage
    @connection = BuildersWorld::Connect.call()
  end

  def retrieve_products
    BuildersWorld::ProductsDownloader.call({
      connection: @connection
    })
  end

  def save_temp_file 
    # PENDING
  end
end

