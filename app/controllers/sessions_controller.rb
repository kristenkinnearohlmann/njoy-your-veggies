class SessionsController < ApplicationController
    # skip_before_action :authenticated_user, only: [:new, :create]

    def new

    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to login_path
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end

    private

    def session_params

    end

end