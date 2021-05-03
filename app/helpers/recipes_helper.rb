module RecipesHelper
    def recipe_detail(recipe)
        content_tag(:p, link_to(recipe.name,recipe_path(recipe.id)))
        contnet_tag(:p, recipe.description)
    end
end