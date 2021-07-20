class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def index
  end
  
  def edit
  end
  
  def update
  end  
  
  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
  
end
