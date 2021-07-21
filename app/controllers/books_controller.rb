class BooksController < ApplicationController
  
  def index
   @user = current_user
   @books = Book.all
   @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(params[:id])
  end
  
end