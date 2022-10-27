class AddUniqueIndexToBuildxactCategoryCategoryId < ActiveRecord::Migration[7.0]
  def change
    add_index :buildxact_categories, [:subcategory_id], unique: true
  end
end
