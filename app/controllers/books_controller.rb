class BooksController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def new

    @book = Book.new

  end

 def create

    @book = Book.new(book_params)

    @book.user_id = current_user.id

    @user = current_user

    @users = User.all

    if @book.save

    flash[:notice] = "You have created book successfully."

    redirect_to book_path(@book.id)

    else

      @books= Book.all

      render :index

    end
 end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book =Book.find(params[:id])
    @user = @book.user
    @books = Book.all
    @users = User.all
  end

   def update

    @book = Book.find(params[:id])

    @book.update(book_params)

    if @book.save

    flash[:notice] = "You have updated book successfully."

    redirect_to book_path(@book.id)

    else

      @books= Book.all

      render :edit

    end
   end

  def index

    @book = Book.new

    @books = Book.all

    @user = current_user

    @users = User.all

  end


  def destroy

    book = Book.find(params[:id])

    book.destroy

    flash[:notice] = "You have deleted book successfully."

    redirect_to '/books'

  end

  def book_params

    params.require(:book).permit(:pofile_image, :title, :body)

  end

  def is_matching_login_user

     book = Book.find(params[:id])

    unless book.user == current_user

       redirect_to books_path

    end

  end

end
