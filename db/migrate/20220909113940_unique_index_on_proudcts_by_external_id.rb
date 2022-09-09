class UniqueIndexOnProudctsByExternalId < ActiveRecord::Migration[7.0]
  def change
    add_index :items, :external_id, unique: true
  end
end
