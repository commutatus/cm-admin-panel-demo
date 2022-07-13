class CmAdmin::LogPolicy < ApplicationPolicy


  def index?
    @user.super_admin?
  end
  
end