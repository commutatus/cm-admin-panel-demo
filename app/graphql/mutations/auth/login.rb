module Mutations
  class Auth::Login < BaseMutation
    description "Login with email address"

    type Types::Objects::AuthType

    argument :email, String, required: true

    def resolve(email:, source: nil)
      user = ::User.where(email: email).first_or_initialize
      if user.new_record?
        user.save!
        user.find_or_generate_api_key
      else
        user.create_otp_request
        raise OtpVerificationRequired, "OTP verification required"
      end
    end
  end
end
