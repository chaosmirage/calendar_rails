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
      redirect_to @user
    else
      flash.now[:danger] = "Account didn't create!"
      render 'new'
    end
  end
end
