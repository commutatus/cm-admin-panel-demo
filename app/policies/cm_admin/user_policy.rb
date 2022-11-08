class CmAdmin::UserPolicy < ApplicationPolicy

  def index?
    @user.super_admin?
  end

  def show?
    @user.super_admin?
  end

  def edit?
    @user.super_admin?
  end

  def create?
    @user.super_admin?
  end

  def update?
    @user.super_admin?
  end

  def user_dsl?
    @user.super_admin?
  end

  def user_import?
    @user.super_admin?
  end

  def import?
    @user.super_admin?
  end

  def educational_details?
    @user.super_admin?
  end  

end