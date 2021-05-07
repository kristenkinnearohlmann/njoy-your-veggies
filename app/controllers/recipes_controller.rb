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
        if params[:recipe][:user_id] == current_user.id.to_s
            @recipe = current_user.recipes.new(recipe_params(:name, :description, :recipe_type, :instructions, :story))

            @recipe.add_ingredients(recipe_params(:ingredients)) if params[:recipe][:ingredients].present?

            if @recipe.save
                redirect_to recipe_path(@recipe)
            else
                @recipe.errors.add(:ingredients,"no ingredients added") if params[:recipe][:ingredients].empty?
                render controller: 'recipes', action: 'new'
            end
        else
            flash[:msg] = "You must be logged in to create a recipe."
            render recipes_path
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update

    end

    private

    def recipe_params(*args)
        params.require(:recipe).permit(*args)
    end

end