class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

    validates :name, presence: true
    validate :name_singular?

    def name_to_singular
        name.singularize
    end

    def name_to_plural
        name.pluralize
    end

    private

    def name_singular?
        if name.present? && name != name.singularize
            errors.add(:name, "must be singular")
        end
    end

end
