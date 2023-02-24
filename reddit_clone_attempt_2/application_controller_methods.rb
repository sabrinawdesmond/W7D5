def current_user
  @current_user ||= User.find_by(session_token: session[:session_token])
end

def require_logged_in
  redirect_to new_session_url unless logged_in?
end

def require_logged_out
  redirect_to user_url if logged_in?
end

def login(user)
  session[:session_token] = user.reset_session_token
end

def logout!
  @current_user.reset_session_token
  session[:session_token] = nil
  current_user = nil
end

def logged_in?
  !!current_user
end






def current_user
  @current_user = User.find_by(session_token: session[:session_token])
end

def current_user
  @current_user ||= User.find_by(session_token: session[:session_token])
end


def current_user
  @current_user ||= User.find_by(session_token: session[:session_token])
end

def current_user
  @current_user ||= User.find_by(session_token: session[:session_token])
end

def require_logged_in
  redirect_to new_session_url unless logged_in?
end

def require_logged_out
  redirect_to user_url if logged_in?
end

def login(user)
  session[:session_token] = user.reset_session_token
end

def login(user)
  session[:session_token] = user.reset_session_token
end

def login(user)
  session[:session_token] = user.reset_session_token
end

def logout
  self.session_token = generate_unique_session_token
  self.save!
  self.session_token
end

def logged_in?
  !!current_user
end













def current_user
  @current_user ||-=
end

