class AddPriceToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :price_cents, :integer
  end
end
