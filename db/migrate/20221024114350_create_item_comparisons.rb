class CreateItemComparisons < ActiveRecord::Migration[7.0]
  def change
    create_table :item_comparisons do |t|
      t.string :supplier_code
      t.integer :status
      t.datetime :date_of_evaluation

      t.timestamps
    end
  end
end
