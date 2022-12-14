class InvalidOtp < BaseException
  def initialize(message = nil)
    @message = message
  end

  def message
    @message || "Invalid OTP"
  end

  def code
    return :unprocessable_entity
  end

  def sub_code
    return :invalid_otp
  end
end