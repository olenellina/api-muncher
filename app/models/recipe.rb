class Recipe < ActiveRecord::Base
  attr_reader :label, :image, :url, :ingredients, :diet, :health

  def self.build(lable, image, url, ingredients, diet, health)
    recipe = Recipe.new
    recipe.lable = lable
    recipe.image = image
    recipe.url = url
    recipe.ingredients = ingredients
    recipe.diet = diet
    recipe.health = health

    recipe.save

    return recipe
  end
end
