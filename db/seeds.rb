file = URI.open("https://gist.github.com/inicolas69/82c8f65161a31f35ce34177764e2a038/raw/4b4368e8974b5cbc63088e20c826f215b278f476/recipes.json").read
json = JSON.parse(file)

json.each do |recipe|
  new_recipe = Recipe.create(
    title: recipe["title"],
    cook_time: recipe["cook_time"].to_i,
    prep_time: recipe["prep_time"].to_i,
    rating: recipe["ratings"].to_f,
    image_url: CGI.unescape(recipe["image"].split("?url=").last),
  )

  recipe["ingredients"].each do |ingredient|
    ingredient_category = IngredientCategory.find_or_create_by(name: ingredient["ingredient"])

    new_ingredient = Ingredient.find_or_create_by(
      name: ingredient["original_without_quantity_and_unit"],
    ) do |i|
      i.ingredient_category = ingredient_category
    end

    next unless new_recipe.persisted? && new_ingredient.persisted?

    RecipeIngredient.create(
      recipe: new_recipe,
      ingredient: new_ingredient,
      quantity: ingredient["quantity"],
      additional_informations: ingredient["additional_informations"],
    )
  end
end
