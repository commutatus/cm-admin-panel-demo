class CmAdmin::UserPolicy < ApplicationPolicy

  def index?
    @user.super_admin?
  end

  def user_dsl?
    @user.super_admin?
  end

end