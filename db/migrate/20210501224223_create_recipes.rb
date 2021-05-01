class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :recipe_type
      t.text :instructions
      t.text :story
      t.integer :user_id

      t.timestamps
    end
  end
end
