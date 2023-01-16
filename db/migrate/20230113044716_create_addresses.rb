class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street_name
      t.integer :country_id
      t.integer :state_id
      t.integer :city_id
      t.string :pincode

      t.timestamps
    end
  end
end
