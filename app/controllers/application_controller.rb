class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
   @user = request.env['omniauth.origin'] || root_path
   sign_in_and_redirect @user
  end

end
