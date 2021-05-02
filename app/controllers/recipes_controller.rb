class RecipesController < ApplicationController
    skip_before_action :authenticated_user, only: [:index, :show]

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

end