class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user)
    flash[:notice] = "You have updated user successfully."
    else
    render :edit
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
