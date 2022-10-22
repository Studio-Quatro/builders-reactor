class CreateCategoryMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :category_maps do |t|
      t.string :bxa_id
      t.string :bw_id
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
