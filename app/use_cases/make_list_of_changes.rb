# frozen_string_literal: true

class MakeListOfChanges < ApplicationUseCase
  def call
    # retrieve_data
    make_changes_list
    map_changes_list
    save_changes_list
    set_last_update
  end

  private
  
  def make_changes_list
    @supplier_codes_to_change = ItemListComparer.call
  end

  def set_time
    @time = Time.now
  end

  def map_changes_list
    @changes_list = @supplier_codes_to_change.map do |supplier_code|
      {
        supplier_code: supplier_code,
        status: 'pending',
        date_of_evaluation: @time
        created_at: @time,
        updated_at: @time
      }
    end
  end

  def save_changes_list
    ItemComparison.upsert_all(@changes_list)
  end

  def set_last_update
    Setting.last_products_comparison = @time
  end
end
