class Recipe < ApplicationRecord
    validates :name, presence: true
    validates :recipe_type, inclusion: { in: ["Vegetarian","Vegan"], message: "%{value} is not a valid type" }
    validates :instructions, presence: true
    validates :instructions, length: { minimum: 25 }

    belongs_to :user

    def list_instructions
        byebug
    end
end
