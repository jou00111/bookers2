class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book =Book.find(params[:id])
    
  end

  def index
    @books = Book.all
  end
  
  def book_params

      params.require(:user).parmit(:name,:profile_image)

    end
end
