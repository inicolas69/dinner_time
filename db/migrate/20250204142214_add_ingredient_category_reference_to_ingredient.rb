class AddIngredientCategoryReferenceToIngredient < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :ingredient_category, foreign_key: true
  end
end
