class CmAdmin::AddressPolicy < ApplicationPolicy


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

  def country_associated_states?
    index?
  end

  def state_associated_cities?
    index?
  end
  
end