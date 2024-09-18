class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def show

    @user = User.find(params[:id])

    @books = @user.books.page(params[:page])

  end



    def user_params

      params.require(:user).parmit(:name,:profile_image)

    end

end
