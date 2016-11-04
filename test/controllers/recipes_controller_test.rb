require 'test_helper'

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
