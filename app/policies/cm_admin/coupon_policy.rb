class CmAdmin::CouponPolicy < ApplicationPolicy


  def index?
    @user.super_admin?
  end
  
  def show?
    index?
  end
  
  def create?
    index?
  end
  
  def update?
    index?
  end
  
  def destroy?
    index?
  end

  def activate?
    index?
  end

  def deactivate?
    index?
  end
  
end