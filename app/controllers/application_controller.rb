class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :back_url

  def back_url
    request.referer
  end

  def after_sign_in_path_for(resource_or_scope)
    dashboards_path
  end 
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
  end

  def get_tab
    params[:tab] ? { tab: params[:tab] } : nil
  end
end
