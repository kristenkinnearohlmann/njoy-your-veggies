class Ingredient < ApplicationRecord
    validates :name, presence: true
    validate :name_singular?

    private

    def name_singular?
        if name.present? && name != name.singularize
            errors.add(:name, "must be singular")
        end
    end

end
