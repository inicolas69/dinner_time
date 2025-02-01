FactoryBot.define do
  factory :recipe do
    title { "Super Recipe" }
    prep_time { 20 }
    cook_time { 30 }
    rating { 2.5 }
    image_url { "https://recipe_images/image.jpg" }
  end
end
