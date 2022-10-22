class CreateBuildxactItems < ActiveRecord::Migration[7.0]
  def change
    create_table :buildxact_items do |t|
      t.string :catalogue_description
      t.string :category
      t.string :cost_item_type
      t.string :descripcion
      t.string :catalogue_id
      t.string :catalogue_category_id
      t.string :bxa_id
      t.string :catalogue_sub_category_id
      t.string :image_url
      t.boolean :is_recipe
      t.string :sub_category
      t.string :supplier_code
      t.float :unit_cost
      t.string :uom

      t.timestamps
    end
  end
end
