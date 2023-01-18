class CmAdmin::ProductPolicy < ApplicationPolicy


  def index?
    @user.super_admin?
  end

  def new?
    @user.super_admin?
  end

  def create?
    @user.super_admin?
  end

  def create_product?
    @user.super_admin?
  end

  def show?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def toggle_review_count?
    index?
  end
  
end