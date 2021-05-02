class AddIsPluralUnitToRecipeIngredient < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_ingredients, :is_plural_unit, :boolean, default: false
  end
end
