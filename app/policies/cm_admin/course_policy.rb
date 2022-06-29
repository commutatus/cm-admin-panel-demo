class CmAdmin::CoursePolicy < ApplicationPolicy


  def index?
    @user.super_admin?
  end
  
  def show?
    @user.super_admin?
  end
  
  def create?
    @user.super_admin?
  end
  
  def update?
    @user.super_admin?
  end
  
  def destroy?
    @user.super_admin?
  end

  def chapters?
    show?
  end

  def course_coaches?
    show?
  end

  def assessments?
    show?
  end

  def course_detail?
    show?
  end
  
end