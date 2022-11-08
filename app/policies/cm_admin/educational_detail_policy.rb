class CmAdmin::EducationalDetailPolicy < ApplicationPolicy

  def index?
    @user.super_admin?
  end

end