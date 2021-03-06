class UsersController < ApplicationController

  def index
    @user = User.ApplicationController
    user_id = current_user.id
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
