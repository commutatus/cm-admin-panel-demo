# This migration comes from cm_pay (originally 20210930125941)
class CreateTransaction < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :total_amount_cents, null: false
      t.integer :status, default: 0
      t.datetime :completed_at
      t.string :rzp_order_id, null: false
      t.references :cart, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :mode_of_payment

      t.timestamps
    end
    add_index :transactions, :status
  end
end
