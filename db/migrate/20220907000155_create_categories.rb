class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :wc_id
      t.string :slug
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
