class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = current_user
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
    @books = @user.books
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = current_user.books
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      @users = User.all
      render :edit
    end
  end
  
  def destroy
    @user = current_user
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
end