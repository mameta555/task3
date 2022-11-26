class UsersController < ApplicationController
  def show
    @booknew = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def index
    @booknew = Book.new
    @users = User.all
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
