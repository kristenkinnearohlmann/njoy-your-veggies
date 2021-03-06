# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
   - Used `rails new` to create the application 
- [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
   - User `has_many` Recipes
- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
   - Recipe `belongs_to` User
- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
   - Recipe `has_many` Ingredient `through` RecipeIngredient
   - Ingredient `has_many` Recipe `through` RecipeIngredient
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
   - Recipe `has_many` Ingredients `through` RecipeIngredients, Ingredients `has_many` Recipes `through` RecipeIngredients
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
   - RecipeIngredient has amount and unit
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
   - User
      - Validates email presence and uniqueness
      - Validates password exists
   - Recipe
      - Validates name presence
      - Validates specific recipe_type
      - Validates instructions presence and length
   - Ingredient
      - Validates name presence
      - Custom validation method on name being a singular value
   - RecipeIngredient
     - Validates unit presence
     - Validates amount presence
     - Custom validation method on unit being a singular value
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
   - Created scope for Vegetarian recipes ['/recipes/vegetarian'](http://localhost:3000/recipes/vegetarian)
   - Created scope for Vegan recipes ['/recipes/vegan'](http://localhost:3000/recipes/vegan)
- [X] Include signup (how e.g. Devise)
   - Created sign up with `form_for` wrapped around a `User` object
   - Logged user into session
- [X] Include login (how e.g. Devise)
   - Login form handles both a user created on the website and an FB user signing in
   - Form displays errors
- [X] Include logout (how e.g. Devise)
   - Logout route resets the session
   - Logout route redirects user to the root route
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
   - Used OmnitAuth with the Facebook strategy
   - Used the `match` keyword from the OmniAuth lab to allow for addition of more strategies post-MVP
- [X] Include nested resource show or index (URL e.g. users/2/recipes)
   - Included link for most recent recipe on user's profile page
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
   - Added new recipe form nested as `/users/:id/recipes/new`
- [X] Include form display of validation errors (form URL e.g. /recipes/new)
   - Forms include call to helper method for form errors in `application_helper`

Confirm:
- [X] The application is pretty DRY
   - I continuously reviewed code for logic to be abstracted to a more central location
- [X] Limited logic in controllers
   - Moved involved logic to the models
- [X] Views use helper methods if appropriate
   - Handled form errors in `application_helper`
   - Handled listing recipes in `recipes_helper`
- [X] Views use partials if appropriate
   - Sign up form is rendered via partial
   - Log in form is rendered via partial
   - Recipe listing is rendered via partial