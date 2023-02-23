class Test

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def current_user
        return nil unless session[:session_token] 
        @current_user ||= User.find_by(session: session[:session_token])
    end
end