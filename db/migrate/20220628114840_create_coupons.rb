class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :title
      t.integer :discount_amount_cents
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
