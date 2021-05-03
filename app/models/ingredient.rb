class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients

    validates :name, presence: true
    validate :name_singular?

    private

    def name_singular?
        if name.present? && name != name.singularize
            errors.add(:name, "must be singular")
        end
    end

end
