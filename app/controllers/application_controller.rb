class ApplicationController < ActionController::Base
  include SessionsHelper

  def flash_error(x)
    flash[:danger] = "Bummer Dude! #{x.errors.full_messages}"
  end

  def link_to_log_in_header
    if logged_in?
      "<%= link_to 'Log Out, logout_path, method: :delete %>".html_safe
    else
      "<%= link_to 'Log In', login_path %>".html_safe
    end
  end
end
