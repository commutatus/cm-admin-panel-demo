module Mutations
  class Auth::VerifyOtp < BaseMutation
    description "Validate the OTP entered."

    type Types::Objects::AuthType

    argument :email, String, required: true
    argument :otp, String, required: true

    def resolve(email:, otp:)
      user = ::User.where(email: email).first
      if user.verify_otp(otp)
        user.find_or_generate_api_key
      else
        raise InvalidOtp, "Invalid OTP, Please check the OTP"
      end
    end
  end
end
