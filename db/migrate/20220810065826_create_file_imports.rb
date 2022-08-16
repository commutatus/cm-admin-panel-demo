class CreateFileImports < ActiveRecord::Migration[6.1]
  def change
    create_table :file_imports do |t|
      t.string :associated_model_name, null: false

      t.timestamps
    end
  end
end
