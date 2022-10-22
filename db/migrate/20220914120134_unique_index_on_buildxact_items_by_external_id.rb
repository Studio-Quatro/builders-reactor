class UniqueIndexOnBuildxactItemsByExternalId < ActiveRecord::Migration[7.0]
  def change
    add_index :buildxact_items, :bxa_id, unique: true
  end
end
