class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  validates :quantity, presence: true

  delegate :name, to: :ingredient

  def full_ingredient
    "#{quantity} #{unit.pluralize(quantity)} #{ingredient.name}"
  end
end
