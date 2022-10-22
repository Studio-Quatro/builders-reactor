class ChangeDescripcionByDescriptionOnBuildxactItem < ActiveRecord::Migration[7.0]
  def change
    rename_column :buildxact_items, :descripcion, :description
  end
end
