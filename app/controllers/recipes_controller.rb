class RecipesController < ApplicationController
    skip_before_action :authenticated_user, only: [:index, :show, :vegetarian, :vegan]

    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def vegetarian
        @recipes = Recipe.vegetarian
    end

    def vegan
        @recipes = Recipe.vegan
    end

end