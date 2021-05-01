class SessionsController < ApplicationController
    skip_before_action :authenticated_user, only: [:new, :create]

    def new

    end

    def create
        byebug
        if params.has_key?(:provider)
            create_fb if params[:provider] == "facebook"
        else
            create_local
        end
        # user = User.find_by(email: params[:email])
        # if user && user.authenticate(params[:password])
        #     login_success(user)
        #     # session[:user_id] = user.id
        #     # redirect_to user_path(user)
        # else
        #     redirect_to login_path
        # end
    end

    def create_local
        byebug
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            login_success(user)
            # session[:user_id] = user.id
            # redirect_to user_path(user)
        else
            redirect_to login_path
        end
    end

    def create_fb
        byebug
        user = User.find_or_create_by(id: auth['uid']) do |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
            u.name = auth['info']['name']
        end

        login_success(user)
    end

    def destroy
        reset_session
        redirect_to root_path
    end

    private

    def session_params

    end

    def auth
        request.env['omniauth.auth']
    end

    def login_success(user)
        byebug
        session[:user_id] = user.id
        redirect_to user_path(user)
    end

end