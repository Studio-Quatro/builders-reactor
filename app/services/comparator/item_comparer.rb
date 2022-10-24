# frozen_string_literal: true

class Comparator::ItemComparer < ApplicationService
  def initialize(params)
    @target_item = params[:target_item]
    @origin_item = params[:origin_item]
  end


  # Compare origin_hash and target_hash
  # Return true if they are the same
  # Return false if they are different or target_item
  # is nil
  def same? 
    return false unless target_item
    origin_hash == target_hash
  end

  private 

  attr_reader :target_item, :origin_item

  # Build hash for Item with the following data:
  # description, image_url, is_recipe, supplier_code, unit_cost, uom
  def origin_hash 
    {
      description: origin_item.description,
      image_url: origin_item.image_url,
      is_recipe: origin_item.is_recipe,
      supplier_code: origin_item.supplier_code,
      unit_cost: origin_item.unit_cost,
      uom: origin_item.uom
    }
  end

  # Build hash for bxa_item with:
  # description, image_url, is_recipe, supplier_code, unit_cost, uom
  def target_hash
    {
      description: target_item.description,
      image_url: target_item.image_url,
      is_recipe: target_item.is_recipe,
      supplier_code: target_item.supplier_code,
      unit_cost: target_item.unit_cost,
      uom: target_item.uom
    }
  end

end
