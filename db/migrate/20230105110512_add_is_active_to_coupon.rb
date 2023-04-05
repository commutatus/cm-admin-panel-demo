class AddIsActiveToCoupon < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :is_active, :boolean, default: false
  end
end
