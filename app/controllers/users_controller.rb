class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account Created! Happy Gaming!"
      redirect_to root_path
    else
      flash_error(@user)
    end
  end

  private

    def user_params
      allowed = [:screen_name, :password, :password_confirmation,
                                    :email, :permission]
      params.require(:user).permit(allowed)
    end
end
