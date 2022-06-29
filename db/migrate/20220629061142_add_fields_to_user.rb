class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :dob, :datetime
    add_column :users, :gender, :integer
    add_column :users, :mobile_number, :string
  end
end
