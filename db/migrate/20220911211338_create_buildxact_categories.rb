class CreateBuildxactCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :buildxact_categories do |t|
      t.string :name
      t.string :category_id
      t.string :subcategory
      t.string :subcategory_id
      t.string :item_count

      t.timestamps
    end
  end
end
