# This migration comes from cm_cart_engine (originally 20210930110624)
class CreateCart < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'uuid-ossp'
    create_table :carts do |t|
      t.integer :discount_amount_cents, default: 0
      t.integer :sub_total_amount_cents
      t.integer :total_amount_cents, null: false
      t.integer :tax_amount_cents, default: 0
      t.references :coupon, foreign_key: true
      t.references :user, foreign_key: true, null: true
      t.uuid :uuid, default: "uuid_generate_v4()", null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
