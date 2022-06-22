class CreateZoomRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :zoom_registrations do |t|
      t.string :registrant_name
      t.integer :zoom_id

      t.timestamps
    end
  end
end
