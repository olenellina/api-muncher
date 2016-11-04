class Recipe < ActiveRecord::Base
  validates :lable, presence: true
  validates :image, presence: true
  validates :ingredients, presence: true
  validates :url, presence: true, uniqueness: true
  validates :query, presence: true

  def self.build(recipe_hash)
    recipe = Recipe.new
    recipe.image = recipe_hash[:image].to_s
    recipe.lable = recipe_hash[:lable].to_s
    recipe.url = recipe_hash[:url].to_s
    recipe.ingredients = recipe_hash[:ingredients].to_s
    recipe.diet = recipe_hash[:diet].to_s
    recipe.health = recipe_hash[:health].to_s
    recipe.query = recipe_hash[:query].to_s
    recipe.save

    return recipe
  end
end
