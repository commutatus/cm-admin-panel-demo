class CmAdmin::AssessmentPolicy < ApplicationPolicy


  def index?
    @user.super_admin?
  end
  
  def show?
    @user.super_admin?
  end
  
  def create?
    show?
  end
  
  def update?
    show?
  end
  
  def destroy?
    show?
  end
  
end