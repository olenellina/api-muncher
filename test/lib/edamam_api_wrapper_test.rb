require 'test_helper'
require 'edamam_api_wrapper'

class Edamam_Api_WrapperTest < ActionController::TestCase

  test "the truth" do
    assert true
  end

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

   test "a query that does not result in any hits will not add records to the database" do
     VCR.use_cassette("no-query-results") do
       search = Edamam_Api_Wrapper.get_recipes("2039840q88")
       assert_empty search
      end
   end


end
