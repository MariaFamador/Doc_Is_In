class AccountsController < ApplicationController
  
  def new
    @account = Account.new    
    @account.users.build
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to dashboards_path, notice: "Account created."
    else
      render 'new'
    end
  end

  private

  def account_params
    params.require(:account).permit(
      :name,
      :type,
      users_attributes: [
        :id,
        :email,
        :first_name,
        :last_name,
        :password,
        :password_confirmation
      ]
    )
  end
end
