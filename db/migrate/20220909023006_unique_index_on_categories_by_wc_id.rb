class UniqueIndexOnCategoriesByWcId < ActiveRecord::Migration[7.0]
  def change
    add_index :categories, :wc_id, unique: true
  end
end
