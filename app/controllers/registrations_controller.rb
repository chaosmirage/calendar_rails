class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_if_signed

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.errors.empty?
      flash[:success] = "Account created!"
      redirect_to dashboard_path
    else
      flash.now[:danger] = "Account didn't create!"
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :last_name, :password, :password_confirmation)
  end
end
