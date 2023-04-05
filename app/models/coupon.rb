class Coupon < ApplicationRecord
  include CmAdmin::Coupon
  belongs_to :user

  enum status: { enabled: 0, disabled: 1 }

  def activate
    self.status = :enabled
    self.save!
  end

  def deactivate
    self.status = :disabled
    self.save!
  end
end
