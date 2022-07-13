class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.references :loggable, polymorphic: true, null: false
      t.string :log_content

      t.timestamps
    end
  end
end
