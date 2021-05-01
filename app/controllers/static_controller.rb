class StaticController < ApplicationController
    skip_before_action :authenticated_user, only: [:home, :about]

    def home
        
    end

    def about

    end
    
end