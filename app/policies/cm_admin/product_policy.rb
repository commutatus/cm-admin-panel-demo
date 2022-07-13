class CmAdmin::ProductPolicy < ApplicationPolicy


  def index?
    @user.super_admin?
  end

  def create_product?
    @user.super_admin?
  end

  def show?
    index?
  end
  
end