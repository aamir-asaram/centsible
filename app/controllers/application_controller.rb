class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  # Customize redirect hooks
  def after_sign_in_path_for(_resource)
    categories_path
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
  end

  def authenticate_user
    unless user_signed_in?
      redirect_to custom_path, alert: 'Please sign in to access this page.'
    end
  end

  def custom_path
    # Define your custom path here
    # For example, you can use a named route or a specific URL
    # Example using a named route:
    # return some_named_route_path
    # Example using a specific URL:
    return '/'
  end
end