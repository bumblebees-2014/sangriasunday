helpers do

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def is_attending?(sunday)
    Attendance.find_by(user: current_user, sangria_sunday: sunday)
  end

end
