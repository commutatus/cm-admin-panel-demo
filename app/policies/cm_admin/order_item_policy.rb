class CmAdmin::OrderItemPolicy < ApplicationPolicy


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

  def fetch_product_details?
    index?
  end
  
end