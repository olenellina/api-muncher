class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :lable
      t.string :image
      t.string :url
      t.text :ingredients
      t.string :diet
      t.string :health

      t.timestamps null: false
    end
  end
end
