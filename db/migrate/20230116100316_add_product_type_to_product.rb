class AddProductTypeToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :product_type, :string, array: true, default: []
  end
end
