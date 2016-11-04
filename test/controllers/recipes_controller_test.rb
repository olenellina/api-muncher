require 'test_helper'

# def search
# 1    flash[:notice] = nil
# 1    if params["query"] != nil && params["query"] != ""
#       if Recipe.find_by(query: params["query"]) == nil
#         @my_results = Edamam_Api_Wrapper.get_recipes(params["query"])
#       end
#       if @my_results != []
#         redirect_to recipe_index_path(params["query"])
#       end
#     end
#   end

class RecipesControllerTest < ActionController::TestCase
  test "should get index for a valid query" do
    get :index, {query: "tacos"}
    assert_response :success
  end

  test "should get show for a recipe record" do
    get :show, {id: 1}
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get a flash notice if query didn't produce results from API call" do
    get :index, {query: "2093840q-9"}
    assert_equal flash[:notice], "Your search failed to return results. Please try again"
  end



end
