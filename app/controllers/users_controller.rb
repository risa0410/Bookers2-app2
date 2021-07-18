class UsersController < ApplicationController
  def show
    @User = User.find(params[:id])
  end
  
  def index
  end
  
  def edit
  end
  
  def update
    
  
end
