module ApplicationHelper
  def link_to_log_in_header
    if logged_in?
      "<%= link_to 'Log Out, logout_path, method: :delete %>".html_safe
    else
      "<%= link_to 'Log In', login_path %>".html_safe
    end
  end
end
