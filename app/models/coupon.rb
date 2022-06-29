class Coupon < ApplicationRecord
  include CmAdmin::Coupon
  belongs_to :user
end
