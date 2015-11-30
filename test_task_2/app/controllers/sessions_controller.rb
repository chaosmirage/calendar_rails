class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, :redirect_if_signed

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Success!'
      sign_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
