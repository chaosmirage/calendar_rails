class UsersController < ApplicationController
  before_filter :find_item, only: [:show]

  def show

  end

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to action: 'show'
    else
      render 'new'
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
