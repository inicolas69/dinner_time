class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @ingredient_categories = IngredientCategory.all

    if params[:ingredient_categories].present?
      category_ids = search_params[:ingredient_categories]

      @recipes = @recipes.joins(ingredients: :ingredient_category)
        .where(ingredient_categories: { id: category_ids })
        .group("recipes.id")
        .having("COUNT(DISTINCT ingredient_categories.id) = ?", category_ids.count)
    elsif params[:query].present?
      @recipes = @recipes.pg_search(params[:query])
    end

    @recipes = @recipes.page(params[:page]).per(12)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.recipe_ingredients
  end

  private

  def search_params
    params.permit(:search, ingredient_categories: [])
  end
end
