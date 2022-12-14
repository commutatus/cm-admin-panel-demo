module Auth
  module User
    extend ActiveSupport::Concern
    # The Following is required for access_token creation
    def find_or_generate_api_key
      self.live_api_key || self.generate_api_key
    end

    def live_api_key
      api_keys.live.last
    end

    def generate_api_key
      self.deactivate_live_api_keys
      api_keys.create
    end

    def deactivate_live_api_keys
      api_keys.live.each { |api_key| api_key.expire }
    end

    def create_otp_request(status = :cancelled)
      self.otp_requests.timed_out.update_all(status: :time_out, expired_at: DateTime.now)
      self.otp_requests.active.update_all(status: status, expired_at: DateTime.now)
      # self.otp_requests.create!(otp: rand(100000..999999), status: :created)
      a = rand(100000..999999)
      self.otp_requests.create!(otp: a, status: :created)
    end

    def verify_otp(otp)
      self.otp_requests.timed_out.update_all(status: :time_out, expired_at: DateTime.now)
      active_otp = self.otp_requests.active.last
      if active_otp.present? && active_otp.otp.to_s == otp
        active_otp.update!(status: :verified, verified_at: DateTime.now)
        # self.otp_requests.active.update_all(status: :cancelled, expired_at: DateTime.now) if self.otp_requests.active.present?
        return true
      else
        return false
      end
    end

    def can_access_admin_panel?
      ::User::USER_TYPES_WITH_ADMIN_ACCESS.include?(self.user_type) && self.active?
    end

  end
end
