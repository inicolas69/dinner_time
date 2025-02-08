class AddUnitToRecipeIngredient < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_ingredients, :unit, :string, default: ""
  end
end
