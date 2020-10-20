class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    helper_method :authentication_required, :logged_in?, :current_user, :create_session
    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 

    def create_session
        session[:user_id] = @user.id
    end 

    def logged_in? 
        !!current_user 
    end 

    def authentication_required 
        if !logged_in? 
            render json: "NOT LOGGED IN"
        end 
    end
end
