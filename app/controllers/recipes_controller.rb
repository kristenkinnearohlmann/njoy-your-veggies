class RecipesController < ApplicationController
    skip_before_action :authenticated_user, only: [:index, :show, :vegetarian, :vegan]

    def index
        @recipes_vegetarian = vegetarian
        @recipes_vegan = vegan
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

    def new
        @recipe = Recipe.new
    end

    def create
        byebug
        # params[:recipe][:user_id] == current_user.id.to_s
        # TODO: Handle ingredients - different params?
#         recipe = u.recipes.new(top level recipe stuff)  
# recipe.add_ingredients([])  
# r.save  
    end

    private

    def recipe_params
        params.require(:recipe).permit(
            :name,
            :description,
            :recipe_type,
            :instructions,
            :story,
            :user_id
        )
    end
end