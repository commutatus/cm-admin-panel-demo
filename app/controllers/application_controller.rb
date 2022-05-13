class ApplicationController < ActionController::Base
  include Authentication

  def after_sign_in_path_for(resource)
    flash[:notice] = 'You have successfully signed in!'
    cm_admin.user_index_path
  end
end
