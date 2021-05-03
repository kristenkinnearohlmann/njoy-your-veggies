class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    scope :vegetarian, -> { where(recipe_type: "Vegetarian") }
    scope :vegan, -> { where(recipe_type: "Vegan") }

    validates :name, presence: true
    validates :recipe_type, inclusion: { in: ["Vegetarian","Vegan"], message: "%{value} is not a valid type" }
    validates :instructions, presence: true
    validates :instructions, length: { minimum: 25 }

    def user_name
        user.name.present? ? user.name : user.email
    end

    def add_ingredients(ingredients_list)
        ingredients_list.each do |ingredient|
            result = recipe_ingredient_parts(LittleRecipeParser::Parse.new(ingredient))
            self.recipe_ingredients.build(result)
        end
    end

    def recipe_ingredient_parts(result)
        recipe_ingredient_parts = {}

        result.tag.present? ? result.tag = result.tag.downcase : result.tag = result.raw_ingredient.gsub(/#{result.quantity}\s#{result.measurement}\s/,"").downcase
        ingredient = Ingredient.find_or_create_by(name: result.tag.singularize)

        if ingredient.valid?
            recipe_ingredient_parts = {
                :recipe_id => self.id,
                :ingredient_id => ingredient.id,
                :amount => result.quantity,
                :unit => result.measurement,
                :is_plural_amount => item_plural?(result.quantity),
                :is_plural_unit => item_plural?(result.measurement),
                :is_plural_ingredient => item_plural?(result.tag)
            }
        else
            self.errors.add("Ingredient",ingredient.errors.full_messages)
        end
        recipe_ingredient_parts
    end

    def item_plural?(item)
        item.pluralize == item
    end

    def list_ingredients
        ingredients_list = []
        recipe_ingredients.each do |recipe_ingredient|
            ingredients_list << recipe_ingredient.full_ingredient
        end
        ingredients_list
    end

    def list_instructions
        instructions.split(".").collect {|item| "#{item.strip}."}
    end

end
