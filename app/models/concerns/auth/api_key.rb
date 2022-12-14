module Auth
  module ApiKey
    extend ActiveSupport::Concern
    included do
      def self.verify(access_token)
        api_key = self.live.find_by(access_token: access_token)
        if api_key
          return api_key
        else
          return ::ApiKey.none
        end
      end
    end
  
    def expire
      self.update(expires_at: DateTime.now)
    end
  
    private
  
    def generate_access_token
      self.access_token = SecureRandom.hex
    end
  
    def set_expiration
      self.expires_at = Date.today + 30
    end
  end
end