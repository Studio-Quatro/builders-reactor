# frozen_string_literal: true

class ItemListComparer < ApplicationService
  def call 
    require_bw_items
    require_bxa_items
    make_changes_list
    changes_list 
  end

  private

  def make_changes_list
    @bw_items.each do |bw_item|
      bxa_item = @bxa_items.find_by(supplier_code: bw_item.supplier_code)
      unless bxa_item || compare_items(bw_item, bxa_item)
        changes_list << bw_item.supplier_code
      end
    end
  end

  def changes_list
    @changes_list ||= []
  end

  def compare_items(origin_item, target_item)
    ItemComparer.new({origin_item: , target_item: }).same?
  end

  # Source
  def require_bw_items
    @bw_items = Item.all
  end

  # Target
  def require_bxa_items
    @bxa_items = Buildxact::Item.all
  end
end
