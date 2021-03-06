class BooksController < ApplicationController

  def index
   @user = current_user
   @books = Book.all
   @book = Book.new
  end

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
    redirect_to book_path(@book)
    flash[:notice] = "You have created book successfully."
   else
    render :index
   end
  end

  def show
   @book = Book.find(params[:id])
   @book_comment = BookComment.new
   @user = @book.user
   @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
   if @book.user != current_user
    redirect_to books_path
   end
  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path(@book)
    flash[:notice] = "You have updated book successfully."
   else
    render :edit
   end
  end

  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end