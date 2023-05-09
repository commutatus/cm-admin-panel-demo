class OrderItem < ApplicationRecord
  include CmAdmin::OrderItem

  belongs_to :product

  # monetize :product_price_cents
end
