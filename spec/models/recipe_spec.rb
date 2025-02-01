require "rails_helper"

describe Recipe do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:cook_time) }
  it { should validate_presence_of(:prep_time) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:image_url) }
  it { should have_many(:recipe_ingredients) }
  it { should have_many(:ingredients).through(:recipe_ingredients) }

  context "on create or update" do
    context "when cook_time or prep_time changes" do
      it "sets the total_time" do
        recipe = create(:recipe, cook_time: 20, prep_time: 30)
        recipe.update(cook_time: 40)

        expect(recipe.total_time).to eq(70)
      end
    end
  end
end
