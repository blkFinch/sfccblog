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

    def correct_user
      @user = User.find(params[:id])
      unless @user == current_user || current_user.permission >= 3
        flash[:danger] = "Not Authorized!"
        redirect_to(root_url)
      end
    end

    def is_admin
      unless current_user.permission >= 3
        flash[:danger] = "Not Authorized!"
        redirect_to(root_url)
      end
    end
end
