class CmAdmin::UserPolicy < ApplicationPolicy

  def index?
    @user.super_admin?
  end

end