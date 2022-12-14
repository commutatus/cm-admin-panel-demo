class OtpVerificationRequired < BaseException
  def initialize(message = nil)
    @message = message
  end

  def message
    @message || "Requires OTP verification"
  end

  def code
    return :unprocessable_entity
  end

  def sub_code
    return :otp_verification_required
  end
end