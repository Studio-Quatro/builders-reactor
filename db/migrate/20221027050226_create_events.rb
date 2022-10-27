class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_type
      t.string :event_message

      t.timestamps
    end
  end
end
