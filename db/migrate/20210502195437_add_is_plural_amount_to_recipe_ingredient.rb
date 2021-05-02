class AddIsPluralAmountToRecipeIngredient < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_ingredients, :is_plural_amount, :boolean, default: false
  end
end
