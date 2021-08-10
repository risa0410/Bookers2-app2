class UsersController < ApplicationController
 
  def show
   @user = User.find(params[:id])
   @currentUserEntry=Entry.where(user_id: current_user.id)
   @userEntry=Entry.where(user_id: @user.id)
   unless @user.id == current_user.id
     @currentUserEntry.each do |cu|
      @userEntry.each do |u|
       if cu.room_id == u.room_id then
        @isRoom = true
        @roomId = cu.room_id
       end
      end
     end
     if @isRoom
     else
      @room = Room.new
      @entry = Entry.new
     end
   end
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
   #p "@user:#{@user}"
   #p "current_user.id:#{current_user.id}"
   if @user != current_user
    redirect_to user_path(current_user)
   end
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
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
