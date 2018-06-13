module ApplicationHelper
  def link_to_log_in_header
    if logged_in?
      link_to 'Log Out', logout_path, method: :delete
    else
      link_to 'Log In', login_path
    end
  end

  def can_delete?(user)
    if current_user
     user == current_user || current_user.permission >= 3
    end
  end

  def link_to_user_index
    if is_admin?
      "<a>#{link_to "Users", users_path}</a>".html_safe
    end
  end

end
