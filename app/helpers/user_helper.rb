def current_user

  session[:user_id] = 1 #temporary
  @current_user ||= User.find_by_id(session[:user_id])

end
