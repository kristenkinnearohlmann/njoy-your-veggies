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
        if params[:user_id] 
            user = User.find_by(id: params[:user_id])
            if user.nil? || params[:user_id] != current_user.id.to_s
                redirect_to root, msg: "User not found"
            else
                @recipe = user.recipes.find_by(id: params[:id])
                redirect_to recipes_path, msg: "Recipe not found" if @recipe.nil?
            end
        else
            @recipe = Recipe.find(params[:id])
        end
    end

    def update
        if params[:recipe][:user_id] == current_user.id.to_s
            @recipe = current_user.recipes.find_by(id: params[:id])
            redirect_to recipes_path, error: "Recipe not found" if @recipe.nil?
            if @recipe.present?
                @recipe.update(recipe_params(:name, :description, :recipe_type, :instructions, :story))
                if params[:recipe][:ingredients].present?
                    byebug
                    @recipe.recipe_ingredients.destroy
                    byebug
                    @recipe.add_ingredients(recipe_params(:ingredients))
                end

                redirect_to recipe_path(@recipe)
            else
                @recipe.errors.add(:ingredients,"no ingredients added") if params[:recipe][:ingredients].empty?
                render controller: 'recipes', action: 'edit'
            end
        else
            flash[:msg] = "You must be owner to edit a recipe."
            render recipe_path(@recipe)
        end
    end

    private

    def recipe_params(*args)
        params.require(:recipe).permit(*args)
    end

end