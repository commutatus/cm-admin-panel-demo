class AddReviewFieldToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :display_review, :boolean
    add_column :products, :review_count, :integer
  end
end
