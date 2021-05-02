class RecipeIngredient < ApplicationRecord
    belongs_to :recipe
    belongs_to :ingredient

    validates :amount, presence: true
    validates :unit, presence: true
    validate :unit_singular?

    def unit_to_singular
        unit.singularize
    end

    def unit_to_plural
        unit.pluralize
    end

    private

    def unit_singular?
        if unit.present? && unit != unit.singularize
            errors.add(:unit, "must be singular")
        end
    end

end
