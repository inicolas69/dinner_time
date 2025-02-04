class Recipe::Card::Component < ViewComponent::Base
  delegate :image_tag, to: :helpers

  def initialize(recipe:)
    @recipe = recipe
  end
end
