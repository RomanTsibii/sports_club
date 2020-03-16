class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery


  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to( root_path )
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
  end
end
