class FavoritesController < ApplicationController 
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.build(book: @book)
    favorite.save
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book: @book)
    favorite.destroy
    redirect_to books_path
  end
end