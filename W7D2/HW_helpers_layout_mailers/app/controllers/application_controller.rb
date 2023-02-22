class ApplicationController < ActionController::Base #CELLL
  # Expose `current_user` and `logged_in?` methods to the views
  helper_method :current_user, :logged_in?

  private

  def current_user #C
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_logged_in #E    ensure_logged_in
    redirect_to new_session_url unless current_user
  end

  def logged_in? #L
    !!current_user
  end

  def login!(user) #L
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logout! #L
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def require_logged_out ##extra one
    redirect_to cats_url if current_user
  end
end