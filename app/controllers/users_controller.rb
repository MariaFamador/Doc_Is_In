class UsersController < ApplicationController
  before_action :get_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: "Profile updated."
    else
      render 'edit'
    end
  end

  protected

  def user_params
    params.require(:user).permit(
      :first_name,
      :middle_name,
      :last_name)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
