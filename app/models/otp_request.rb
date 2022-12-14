class OtpRequest < ApplicationRecord
  include Auth::OtpRequest

  after_commit :send_otp_email
  belongs_to :user
  enum status: [:created, :verified, :resent, :time_out, :cancelled]

  def send_otp_email
    # SendOtpEmailJob.perform_later(self.user_id)
  end
end
