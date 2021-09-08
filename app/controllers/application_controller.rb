class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  helper_method :current_user, :logged_in? #this methods will be available in views

  def current_user
    #getter for user if someone is already logged in
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user #convert truthy val => true, falsey => false
  end

  def login(user) #can be accessed from all of the controllers
    # session[:session_token] = user.session_token #set user's session_token to cookies' sesion_token. this can be dangerous if someone finds out others
    session[:session_token] = user.reset_session_token! #reset session token everytime user log in
  end

  def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    @current_user = nil
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def ensure_logged_out
    redirect_to users_url if logged_in?
  end
end
