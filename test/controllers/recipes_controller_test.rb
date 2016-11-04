require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end
  #
  test "should get show" do
    get :show, {id: 1}
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
    assert_render :index
  end

end
