class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @ingredient_categories = IngredientCategory.all

    @recipes = @recipes.pg_search(params[:query]).reorder(nil) if params[:query].present?

    if params[:ingredient_categories].present?
      category_ids = params[:ingredient_categories].compact

      @recipes = @recipes.joins(ingredients: :ingredient_category)
        .where(ingredient_categories: { id: category_ids })
        .group("recipes.id")
        .having("COUNT(DISTINCT ingredient_categories.id) = ?", category_ids.count)
    end

    @recipes = @recipes.where("total_time <= ?", params[:total_time]) if params[:total_time].present?

    if params[:sort].present?
      case params[:sort]
      when "newest"
        @recipes = @recipes.order(created_at: :desc)
      when "oldest"
        @recipes = @recipes.order(created_at: :asc)
      when "rating"
        @recipes = @recipes.order(rating: :desc)
      when "total_time"
        @recipes = @recipes.order(total_time: :asc)
      end
    end

    @recipes = @recipes.page(params[:page]).per(12)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.recipe_ingredients
  end
end
