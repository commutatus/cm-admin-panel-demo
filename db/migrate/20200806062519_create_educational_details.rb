class CreateEducationalDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :educational_details do |t|
      t.integer :educational_type
      t.string :institution
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
