class ApplicationController < ActionController::Base
  include SessionsHelper

  def flash_error(x)
    flash[:danger] = "Bummer Dude! #{x.errors.full_messages}"
  end

  
end
