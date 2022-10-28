# This migration comes from cm_cart_engine (originally 20210930111110)
class CreateCartItem < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :discount_amount_cents, default: 0
      t.integer :sub_total_amount_cents
      t.integer :total_amount_cents, null: false
      t.references :cart, foreign_key: true, null: false
      t.belongs_to :itemable, polymorphic: true
      t.uuid :uuid, default: "uuid_generate_v4()", null: false

      t.timestamps
    end
    add_index :cart_items, [:itemable_id, :itemable_type]
  end
end
