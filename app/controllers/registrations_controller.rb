class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [accounts_attributes: [
      :name, :type]]
  end
end
