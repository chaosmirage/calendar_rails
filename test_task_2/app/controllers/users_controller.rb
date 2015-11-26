class UsersController < ApplicationController
  before_filter :find_user, only: [:show, :edit, :update]

  def show

  end

  def new
    @user = User.new
  end

  def edit

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
