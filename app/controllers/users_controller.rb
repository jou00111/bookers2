class UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

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

    @books = @user.books

  end

  def update

   user = User.find(params[:id])

    unless user.id == current_user.id

      redirect_to users_path

    end

    @user = User.find(params[:id])

    @user.update(user_params)

    if @user.save

      flash[:notice] = "User was successfully updated."

      redirect_to user_path(@user.id)

    else

      @users= User.all

      render :edit

    end

  end



  def user_params

   params.require(:user).permit(:name, :profile_image, :introduction )

  end


  def is_matching_login_user

     user = User.find(params[:id])

    unless user.id == current_user.id

       redirect_to user_path(current_user)

    end

  end

end
