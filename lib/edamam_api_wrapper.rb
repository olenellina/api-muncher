require 'httparty'
require "cgi"

class Edamam_Api_Wrapper
  ID = ENV["ID"]
  TOKEN = ENV["TOKEN"]
  BASE_URL = "https://api.edamam.com/search?"

  def self.get_recipes(query)
    recipe_hash = {}
    # Adding CGI::escape to santize user search input
    url = BASE_URL + "&app_id=#{ID}" + "&app_key=#{TOKEN}" + "&q=#{CGI::escape(query)}" + "&from=#{0}" + "&to=#{100}"

    response = HTTParty.get(url)

    response["hits"].length.times do |x|
      recipe_hash = {image: response["hits"][x]["recipe"]["image"],lable: response["hits"][x]["recipe"]["label"], url: response["hits"][x]["recipe"]["url"], ingredients: response["hits"][x]["recipe"]["ingredientLines"].join(", "), diet: response["hits"][x]["recipe"]["dietLabels"].join(", "), health: response["hits"][x]["recipe"]["healthLabels"].join(", "), query: response["q"]}
      Recipe.build(recipe_hash)
    end
  end

end
