class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.integer :cook_time, null: false
      t.integer :prep_time, null: false
      t.integer :total_time, null: false
      t.float :rating, null: false
      t.string :cuisine, default: ""
      t.string :image_url, null: false

      t.timestamps
    end
  end
end
