class Recipe < ApplicationRecord
  include PgSearch::Model

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :ingredient_categories, through: :ingredients

  validates :title, :cook_time, :prep_time, :rating, :image_url, presence: true

  before_save :set_total_time, if: -> { changes[:cook_time].present? || changes[:prep_time].present? }

  pg_search_scope(
    :pg_search,
    against: :title,
    associated_against: { ingredients: :name },
    using: { tsearch: { prefix: true } },
  )

  private

  def set_total_time
    self.total_time = cook_time + prep_time
  end
end
