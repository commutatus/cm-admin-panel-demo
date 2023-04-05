class AccessDenied < BaseException
  def initialize(message = nil)
    @message = message
  end

  def message
    @message || "You do not have permission to access these records"
  end

  def code
    return :unauthorized
  end

  def sub_code
    return :access_denied
  end
end