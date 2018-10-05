module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorize!(user)
    redirect_to root_path unless authorized?(user)
  end

  def authorized?(user)
    current_user == user
  end

  def require_login
    unless current_user
      redirect_to login_url
    end
  end

  def find_and_ensure_entry(id)
    post = Post.find_by(id: id)
    not_found if post.nil?
    post
  end
end
