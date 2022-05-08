module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private
  def authenticate
    if current_user
      Current.user = current_user
    end
  end
end