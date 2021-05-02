class RecipeIngredient < ApplicationRecord
    validates :amount, presence: true
    validates :unit, presence: true
    validate :unit_singular?

    def unit_to_singular
        unit = unit.singularize
    end

    private

    def unit_singular?
        if unit.present? && unit != unit.singularize
            errors.add(:unit, "must be singular")
        end
    end

end
