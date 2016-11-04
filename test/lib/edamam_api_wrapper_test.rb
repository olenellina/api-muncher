require 'test_helper'
require 'edamam_api_wrapper'

class Edamam_Api_WrapperTest < ActionController::TestCase

  test "the truth" do
    assert true
  end

  # If the cassette is called something different in another test block, another
  # API call will be made to setup that new cassette.
  # Otherwise, any tests in this block will reuse the data stored in the channels
  # cassette for any subsquent assertions.
  # This is recording the response of the method get_recipes.
  # The cassette will be overwritten if you change the method and/or URI
  test "can retrieve a list of recipes for a new query" do
    VCR.use_cassette("recipes") do
      assert_difference('Recipe.count', 100) do
        Edamam_Api_Wrapper.get_recipes("soup")
      end
    end
  end

    test "a query that has already been called will not produce a new set of API calls/results" do
      VCR.use_cassette("recipes-duplicate") do
        Edamam_Api_Wrapper.get_recipes("tacos")
        assert_difference('Recipe.count', 0) do
          Edamam_Api_Wrapper.get_recipes("tacos")
        end
      end
    end
    
   test "a query that contains bad characters will be escaped" do
     VCR.use_cassette("bad-query-characters") do
       Edamam_Api_Wrapper.get_recipes("burgers! and tacos!")
       search = Recipe.where(query: "burgers%21+and+tacos%21")
       assert search.empty?, false
      end
   end

end
