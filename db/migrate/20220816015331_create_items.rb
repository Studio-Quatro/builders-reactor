class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :category
      t.string :cost_item_type
      t.string :description
      t.string :catalogue_category_id
      t.string :external_id
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
