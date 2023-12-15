class UsersController < ApplicationController
  def show
    @user = current_user
    @user = User.find(params[:id])
    if @user.image.present?
      @image_path = @user.image
    else
      @image_path = '/path/to/default-image.jpg'
    end
  end

  def index
    @users = User.all
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User was successfully updated."
    else
      render :edit
    end
  end
  
  def destroy
    @user = current_user
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end