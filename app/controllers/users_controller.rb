class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save!
    redirect_to root_path, notice: "Nailed it!!"
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
