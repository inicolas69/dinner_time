class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.first(24)
    @ingredient_categories = IngredientCategory.all

    if params[:ingredient_categories].present?
      categories = IngredientCategory.where(id: params[:ingredient_categories])

      @recipes = Recipe.joins(ingredients: :ingredient_category)
        .where(ingredient_categories: { id: categories.pluck(:id) })
        .group("recipes.id")
        .having("COUNT(DISTINCT ingredient_categories.id) = ?", categories.count)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
