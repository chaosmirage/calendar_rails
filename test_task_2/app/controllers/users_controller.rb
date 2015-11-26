class UsersController < ApplicationController
  before_filter :find_item, only: [:show]

  def show

  end

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

  private

  def user_params
    params.require(:user).permit(:email, :name, :last_name, :password, :password_confirmation)
  end

  def find_item
    @user = User.where(id: params[:id]).first

    render_404 unless @user
  end
end
