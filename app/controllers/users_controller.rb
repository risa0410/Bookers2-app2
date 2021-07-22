class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  
  def index
    @user = User.find(params[:id])
    @users = User.all
    @books = User.books
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end  
  
  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
  
end
