class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def show

    @user = User.find(params[:id])
    @users = User.all
    @book = Book.new
    @books = @user.books
  end


  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end



  def user_params

   params.require(:user).parmit(:name, :profile_image, :introduction )

  end


  def book_params
    params.require(:book).permit(:image, :title, :body)
  end


  def is_matching_login_user
     user = User.find(params[:id])
    unless user.id == current_user.id
       redirect_to books_path
    end
  end

end
