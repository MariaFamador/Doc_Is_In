class RegistrationsController < Devise::RegistrationsController  

  protected

    def after_sign_in_path_for(resource_or_scope)
      dashboards_path
    end 

    def after_update_path_for(resource)
      edit_user_registration_path(resource)
    end
end