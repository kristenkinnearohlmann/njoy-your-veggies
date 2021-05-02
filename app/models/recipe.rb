class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :name, presence: true
    validates :recipe_type, inclusion: { in: ["Vegetarian","Vegan"], message: "%{value} is not a valid type" }
    validates :instructions, presence: true
    validates :instructions, length: { minimum: 25 }

    def add_ingredients(ingredients_list)
        ingredients_list.each do |ingredient|
            result = confirm_ingredient_tag(LittleRecipeParser::Parse.new(ingredient))
            byebug
        end
    end

    def confirm_ingredient_tag(result)
        result.tag.present? ? result.tag = result.tag.downcase : result.tag = result.raw_ingredient.gsub(/#{result.quantity}\s#{result.measurement}\s/,"").downcase
        result
    end

    def list_ingredients

    end

    def list_instructions
        instructions.split(".").collect {|item| "#{item.strip}."}
    end

end
