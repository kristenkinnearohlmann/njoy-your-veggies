class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    before_action :authenticated_user

    def current_user
        User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def authenticated_user
        byebug
    #     redirect_to root_path unless logged_in?
    end

end
