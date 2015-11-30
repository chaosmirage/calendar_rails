class UsersController < ApplicationController
  skip_before_action :redirect_if_signed
  before_filter :find_user, only: [:show, :edit, :update]

  # TODO: убрать show
  def show

  end

  def edit

  end

  def update
    @user.update_attributes(user_params)
    if @user.errors.empty?
      flash[:success] = "Saved!"
      redirect_to @user
    else
      flash.now[:danger] = "Didn't save!"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :last_name, :password, :password_confirmation)
  end

  def find_user
    @user = User.where(id: params[:id]).first

    render_404 unless @user
  end
end
