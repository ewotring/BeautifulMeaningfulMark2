helpers do
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticate!
    redirect '/sessions/new' unless logged_in?
  end
end
