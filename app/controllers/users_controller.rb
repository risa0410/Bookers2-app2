class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  
  def index
  end
  
  def edit
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(@user.id)
  end  
  
  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
  
end
