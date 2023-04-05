# This migration comes from cm_action_trail (originally 20220302120216)
class CreateActionTrails < ActiveRecord::Migration[6.1]
  def change
    create_table :action_trails do |t|
      t.string :entity_type
      t.integer :entity_id
      t.integer :trail_type
      t.string :event_name, null: false
      t.integer :actor_id
      t.jsonb :entity_changes

      t.timestamps
    end
  end
end
