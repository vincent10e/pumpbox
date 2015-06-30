class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:landing_page, :course_filter, :filter_by_level]


	protected

	def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :school, :grade, :phone, :parent_name, :parent_phone, :parent_occupation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :school, :grade, :phone, :parent_name, :parent_phone, :parent_occupation, :remember_me) }
  end

end
