class AddIsPluralIngredientToRecipeIngredient < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_ingredients, :is_plural_ingredient, :boolean, default: false
  end
end
