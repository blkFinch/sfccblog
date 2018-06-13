class UsersController < ApplicationController
  protect_from_forgery with: :reset_session
  before_action :correct_user, only: [:edit, :update]
  before_action :is_admin, only: [:index]

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
      log_in @user
      redirect_to root_path
    else
      flash_error(@user)
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:sucess] = "Profile Updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      allowed = [:screen_name, :password, :password_confirmation,
                                    :email, :permission, :name]
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
