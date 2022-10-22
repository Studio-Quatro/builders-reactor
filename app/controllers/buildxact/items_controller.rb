class Buildxact::ItemsController < ApplicationController
  def index
    @items = Buildxact::Item.all
  rescue NoMethodError => e
    # Ignore and keep going

  end
end

#=> #<Item:0x0000000109b37ec8
 #id: 303,
 #category: "387",
 #cost_item_type: "Item",
 #description: "Polished 1300 X 750mm Round Heated Towel Rail Right",
 #catalogue_category_id: nil,
 #external_id: "8798",
 #catalogue_sub_category_id: nil,
 #image_url: "https://buildersworld.com.au/wp-content/uploads/2022/07/rtr09.jpg",
 #is_recipe: false,
 #sub_category: "184",
 #supplier_code: "RTR09RIGHT",
 #unit_cost: 695.0,
 #uom: nil,
 #created_at: Fri, 09 Sep 2022 13:33:31.959194000 UTC +00:00,
 #updated_at: Sat, 10 Sep 2022 10:18:17.077836000 UTC +00:00>

