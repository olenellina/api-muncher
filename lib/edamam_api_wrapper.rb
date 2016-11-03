require 'httparty'
require 'uri'

class Edamam_Api_Wrapper
  ID = ENV["ID"]
  TOKEN = ENV["TOKEN"]
  BASE_URL = "https://api.edamam.com/search?"

  def self.get_recipes(query)
    my_recipes = []

    # Adding CGI::escape to santize user search input
    url = BASE_URL + "&app_id=#{ID}" + "&app_key=#{TOKEN}" + "&q=#{CGI::escape(query)}" + "&from=#{0}" + "&to=#{10}"

    response = HTTParty.get(url)

    response["hits"].length.times do |x|
      lable = response["hits"][x]["recipe"]["label"]
      image = response["hits"][x]["recipe"]["image"]
      url = response["hits"][x]["recipe"]["url"]
      ingredients = response["hits"][x]["recipe"]["ingredientLines"]
      diet = response["hits"][x]["recipe"]["dietLabels"]
      health = response["hits"][x]["recipe"]["healthLabels"]
      query = response["q"]
      my_recipes << Recipe.build(lable, image, url, ingredients, diet, health, query)
    end
    return my_recipes
  end

end
