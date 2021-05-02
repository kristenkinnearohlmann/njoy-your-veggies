class RecipeIngredient < ApplicationRecord
    belongs_to :recipe
    belongs_to :ingredient

    validates :amount, presence: true
    validates :unit, presence: true
    validate :unit_singular?

    def full_ingredient
        "#{amount} #{unit_name} #{ingredient_name}"
    end

    def ingredient_name
        is_plural_ingredient? ? self.ingredient.name.pluralize : self.ingredient.name
    end

    def unit_name
        is_plural_unit? ? self.unit.pluralize : self.unit
    end

    private

    def unit_singular?
        if unit.present? && unit != unit.singularize
            errors.add(:unit, "must be singular")
        end
    end

end
