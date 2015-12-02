class UsersController < ApplicationController
  skip_before_action :redirect_if_signed
  before_action :find_user, only: [:show, :edit, :update]

  layout "dashboard"

  def edit

  end

  def update
    @user.update_attributes(user_params)

    if @user.errors.empty?
      flash[:success] = "Saved!"
      redirect_to dashboard_path
    else
      flash.now[:danger] = "Didn't save!"
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :name, :last_name, :password, :password_confirmation
    )
  end

  def find_user
    @user = current_user
  end
end
