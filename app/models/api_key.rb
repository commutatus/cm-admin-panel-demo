class ApiKey < ApplicationRecord
  include Auth::ApiKey
  
  belongs_to :user
  before_create :generate_access_token, :set_expiration

  scope :live, -> {where('expires_at > ?', DateTime.now)}
end
