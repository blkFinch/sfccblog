class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(screen_name: params[:session][:screen_name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid Log In X_X'
      redirect_to root_path
    end
  end

  def destroy
    log_out
    flash[:success] = "Come Back Soon!"
    redirect_to root_path
  end
end
