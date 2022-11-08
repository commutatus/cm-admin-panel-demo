class AddColumnDescriptionToEducationalDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :educational_details, :description, :text
  end
end
