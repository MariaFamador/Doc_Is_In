class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_role, :current_account, :back_url

  def current_role
    @current_role = current_user.roles.find_by(account_id: params[:account_id])
  end

  def current_account
    current_role.account
  end

  def back_url
    request.referer
  end

  def after_sign_in_path_for(resource_or_scope)
    account_dashboards_path(account_id: current_user.accounts.first.id)
  end

  protected

  def get_tab
    params[:tab] ? { tab: params[:tab] } : nil
  end
end
