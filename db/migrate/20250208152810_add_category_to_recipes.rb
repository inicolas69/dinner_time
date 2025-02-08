class AddCategoryToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :category, :string, default: ""
  end
end
