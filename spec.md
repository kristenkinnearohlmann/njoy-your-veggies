# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
   - Used `rails new` to create the application 
- [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
   - User `has_many` Recipes
- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
   - Recipe `belongs_to` User
- [ ] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [ ] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
   - User
      - Validates email presence and uniqueness
      - Validates password exists
   - Recipe
      - Validates name presence
      - Validates specific recipe_type
      - Validates instructions presence and length
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
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
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [X] Include form display of validation errors (form URL e.g. /recipes/new)
   - Forms include call to helper method for form errors in `application_helper`

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [X] Views use helper methods if appropriate
   - Handled form errors in `application_helper`
- [X] Views use partials if appropriate
   - Sign up form is rendered via partial
   - Log in form is rendered via partial