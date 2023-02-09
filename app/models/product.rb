class Product < ApplicationRecord
  include CmAdmin::Product

  monetize :price_cents

  scope :with_review_count, -> { where.not(review_count: [nil, 0]) }
end
