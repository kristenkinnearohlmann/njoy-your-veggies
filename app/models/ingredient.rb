class Ingredient < ApplicationRecord
    validates :name, presence: true
    validate :name_singular?

    def name_to_singular
        name = name.singularize
    end

    private

    def name_singular?
        if name.present? && name != name.singularize
            errors.add(:name, "must be singular")
        end
    end

end
