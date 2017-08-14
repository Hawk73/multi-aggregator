class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login!
    redirect_to(new_user_session_url) and return false unless current_user
    true
  end

  # TODO: enable if it need
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_in) do |user_params|
  #     user_params.permit(:username, :email)
  #   end
  #
  #   devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  #     user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
  #   end
  # end
end
