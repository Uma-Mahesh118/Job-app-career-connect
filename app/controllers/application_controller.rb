class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :logged2_in?, :current_user2
    def current_user
        @current_user ||= Company.find(session[:user_id]) if session[:user_id]
    end
    def current_user2
        @current_user2 ||= Applicant.find(session[:user2_id]) if session[:user2_id]
    end
    def logged_in?
        !!current_user
    end
    def logged2_in?
        !!current_user2
    end
    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to do this action"
            redirect_to login_path
        end
    end
    def require_user2
        if !logged2_in?
            flash[:alert] = "You must be logged in to do this action"
            redirect_to login2_path
        end
    end
end
