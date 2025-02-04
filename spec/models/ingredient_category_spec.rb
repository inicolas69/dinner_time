require "rails_helper"

RSpec.describe IngredientCategory, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:ingredients) }
  it { should have_many(:recipes).through(:ingredients) }
end
