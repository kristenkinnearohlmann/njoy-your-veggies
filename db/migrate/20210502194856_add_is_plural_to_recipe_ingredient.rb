class AddIsPluralToRecipeIngredient < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_ingredients, :is_plural, :boolean, default: false
  end
end
