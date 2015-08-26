class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :address, :phone_number, :offence, :district_id, :user_type_id]
    devise_parameter_sanitizer.for(:account_update) << [:name, :address, :phone_number, :offence, :district_id, :user_type_id]    
  end
end
