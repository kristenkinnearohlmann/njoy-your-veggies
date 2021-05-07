# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# recipes for first user
user = User.find_by(email: "kristenkinnearohlmann@gmail.com")

# recipe 1
recipe = user.recipes.build(name: "Odd recipe", description: "This one comes out of left field...", recipe_type: "Vegan", instructions: "Don't add this stuff together or it will taste weird|Instead, go out and get something tasty from Chipotle")
ingredients = {"recipe"=>{"ingredients"=>"2 cup oats\r\n1 bunch kale\r\n1/4 tablespoon olive oil"}}
recipe.add_ingredients(ingredients["recipe"])
recipe.save

# recipe 2
recipe = user.recipes.build(name: "Yogurt and Granola", description: "Great for a snack anytime", recipe_type: "Vegetarian", instructions: "Add yogurt to bowl|Add granola to bowl and stire|Garnish with nuts, if desired", image:"recipe_2.jpg")
ingredients = {"recipe"=>{"ingredients"=>"1 cup yogurt\r\n1/2 cup granola\r\n1 tablespoon almonds"}}
recipe.add_ingredients(ingredients["recipe"])
recipe.save

# recipe 3
recipe = user.recipes.build(name: "Oats and Berries and Chocolate", description: "This recipe is for testing", recipe_type: "Vegetarian", instructions: "Add oatmeal and milk to bowl and warm|Add berries to bowl|Top with chocolate chips")
ingredients = {"recipe"=>{"ingredients"=>"1 cup oats\r\n1/2 cup raspberries\r\n4 tablespoons chocolate chips"}}
recipe.add_ingredients(ingredients["recipe"])
recipe.save

# recipes for second user
user = User.find_by(email: "kkinnea@gmail.com")

# recipe 4
recipe = user.recipes.build(name: "Toast", description: "A comforting classic", recipe_type: "Vegan", instructions: "Place bread into toaster and select level of doneness|Press lever to toast bread|When toasted, spread with your favorite vegan spread, such as avocado or mashed white beans", image:"recipe_4.jpg")
ingredients = {"recipe"=>{"ingredients"=>"2 slices bread\r\n1 tablespoon spread"}}
recipe.add_ingredients(ingredients["recipe"])
recipe.save

# recipe 5
recipe = user.recipes.build(name: "Oatmeal with Dried Fruit", description: "A quick treat or meal any time of the day, including chocolate chips and dried fruit!", recipe_type: "Vegetarian", instructions: "Cook oatmeal according to package directions.|Stir in coconut oil until melted.|Stir in flax.|Add chocolate chips - do not stir!|Heat once chocolate chips are added for 20 seconds.|Add dried fruit on top.", story: "This method is based on a Runner's World recipe which included dried cherries and chocolate. Both have antioxidants to replenish your body after running. This is a great meal paired with some eggs.")
ingredients = {"recipe"=>{"ingredients"=>"1/4 cup oatmeal\r\n2 ounces chocolate chips\r\n1/4 cup dried fruit\r\n3 tablespoons flax\r\n1 teaspoon coconut oil"}}
recipe.add_ingredients(ingredients["recipe"])
recipe.save

# recipe 6
recipe = user.recipes.build(name: "Massaged Raw Kale Salad", recipe_type: "Vegetarian", instructions: "Slice the kale into 1/4-inch ribbons|In a large bowl combine the kale with oil and salt|Massage the kale for 3 minutes until the kale softens|Toss with the lemon juice and grated cheese and serve", image: "recipe_3.jpg")
ingredients = {"recipe"=>{"ingredients"=>"1 bunch kale\r\n1 tablespoon olive oil\r\n1/2 teaspoon kosher salt\r\n1 tablespoon lemon juice\r\n1/3 cup Parmesan cheese"}}
recipe.add_ingredients(ingredients["recipe"])
recipe.save