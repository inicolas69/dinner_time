class AddAdditionalInformationsToRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_ingredients, :additional_informations, :string
  end
end
