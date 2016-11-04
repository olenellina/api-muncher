require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  test "should get redirected to index for a valid query" do
    get :index, {query: "tacos"}
    assert_response :success
  end

  test "should get show for a recipe record" do
    get :show, {id: 1}
    assert_response :success
  end

  test "should get a flash notice if query didn't produce results from API call" do
    get :index, {query: "2093840q-9"}
    assert_equal flash[:notice], "Your search failed to return results. Please try again."
  end

  test "should get a flash notice if a search query is sent with nil as the value (user just presses button)" do
    get :search, {query: nil}
    assert_equal flash[:notice], "Please enter a valid search term."
  end

  test "should get redirected back to root path if a query is nil" do
    get :search, {query: nil}
    assert_redirected_to root_path
  end

  test "should get redirected back to root path if a query is empty" do
    get :search, {query: ""}
    assert_redirected_to root_path
  end
end
