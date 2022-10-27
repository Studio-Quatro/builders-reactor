# frozen_string_literal: true

class PerformStepOfRecipeUseCase < ApplicationUseCase
  def initialize(item)
    @item = item
  end

  def call
    find_item_on_bw
    item_exists_on_bxa? ? update_item : create_item
    store_event
  end

  private

  attr_reader :item, :bw_item, :bxa_item

  def find_item_on_bw
    @bw_item = Item.find_by(item.supplier_code)
  end

  def item_exists_on_bxa?
    @bxa_item = Buildxact::Item.find_by(supplier_code: item.supplier_code)
  end

  def update_item
    Buildxact::ItemUpdater.call(bxa_item, bw_item)
  end

  def create_item
    Buildxact::ItemCreator.call(bw_item)
  end

  def store_event
    Event.create(
      event_type: 'info',
      event_message: "Item #{item.supplier_code} updated"
    )
  end
end
