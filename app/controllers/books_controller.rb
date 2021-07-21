class BooksController < ApplicationController
  
  def index
   @user = current_user
   @books = Book.all
   @book = Book.new
  end
  
  def create
   book = Book.new(book_params)
   book.save
   redirect_to user_path(@user.id)
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
  
end