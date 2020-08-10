class AddAddressToEducationalDetail < ActiveRecord::Migration[6.0]
  def change
    add_column :educational_details, :address_line1, :string
    add_column :educational_details, :address_line2, :string
  end
end
