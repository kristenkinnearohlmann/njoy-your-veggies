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
        if params[:recipe][:user_id] == current_user.id.to_s
            @recipe = current_user.recipes.new(recipe_params(:name, :description, :recipe_type, :instructions.split("\r\n"),:story))
            byebug
            @recipe.add_ingredients(recipe_params(ingredients: [:ingredients].split("\r\n")))
            byebug
            if @recipe.save
                redirect_to recipe_path(@recipe)
            else
                render new_user_recipe_path(current_user)
            end
        else
            flash[:msg] = "You must be logged in to create a recipe."
            render recipes_path
        end
    end

    private

    def recipe_params(*args)
        params.require(:recipe).permit(*args)
    end

end