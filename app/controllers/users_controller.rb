class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    user = User.find(current_user.id)
    user.update(user_params)
    redirect_to user_path(@user)
  end
  
  def destroy
    @user = current_user
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end