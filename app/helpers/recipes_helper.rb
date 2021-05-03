module RecipesHelper
    def p_for_recipe(recipe)
        content_tag(:p, recipe) do
            yield
        end
    end
end