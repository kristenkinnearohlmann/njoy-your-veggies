class UsersController < ApplicationController
    skip_before_action :authenticated_user, only: [:new, :create]

    def index
        # TODO: Scope method in User to return only users
        # that have contributed recipes
        @user = User.all
    end

    def show
        @user = current_user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :email, 
            :password, 
            :name, 
            :provider)
    end

end