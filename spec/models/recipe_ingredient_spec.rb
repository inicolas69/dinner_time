require "rails_helper"

RSpec.describe RecipeIngredient, type: :model do
  it { should belong_to(:recipe) }
  it { should belong_to(:ingredient) }
  it { should validate_presence_of(:quantity) }
  it { should delegate_method(:name).to(:ingredient) }

  describe "#full_ingredient" do
    it "returns the full ingredient" do
      recipe_ingredient = create(:recipe_ingredient, quantity: 2, unit: "cup", ingredient: create(:ingredient, name: "flour"))

      expect(recipe_ingredient.full_ingredient).to eq("2 cups flour")
    end
  end
end
