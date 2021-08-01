class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(book_id: params[:book_id])
    redirect_back(fallback_location: root.path)
  end

  def destroy
    @book = Book.find(params[:id])
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    @favorite.destroy
    redirect_back(fallback_location: root.path)
  end

end
