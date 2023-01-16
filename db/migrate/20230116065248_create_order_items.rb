class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :total_amount_cents
      t.references :product, null: false, foreign_key: true
      t.integer :product_price_cents

      t.timestamps
    end
  end
end
