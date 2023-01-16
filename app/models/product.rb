class Product < ApplicationRecord
  include CmAdmin::Product

  monetize :price_cents
end
