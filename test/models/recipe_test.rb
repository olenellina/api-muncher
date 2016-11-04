require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "A recipe must have a lable" do
    assert_equal recipes(:one).lable, "Black bean tacos"
    assert recipes(:one).valid?
    recipes(:one).lable = nil
    assert_not recipes(:one).valid?
  end

  test "A recipe must have an image URL" do
    assert_equal recipes(:two).image, "https://www.edamam.com/image2.jpg"
    assert recipes(:two).valid?
    recipes(:two).image = nil
    assert_not recipes(:two).valid?
  end

  test "A recipe must have a URL" do
    assert_equal recipes(:one).url, "https://www.tacos.com"
    assert recipes(:one).valid?
    recipes(:one).url = nil
    assert_not recipes(:one).valid?
  end

  test "A recipe must have associated ingredients" do
    assert_equal recipes(:two).ingredients, "veggie burgers, buns"
    assert recipes(:two).valid?
    recipes(:two).ingredients = nil
    assert_not recipes(:two).valid?
  end

  test "A recipe must a unique URL" do
    assert_equal recipes(:one).url, "https://www.tacos.com"
    assert recipes(:one).valid?
    recipes(:two).url = "https://www.tacos.com"
    assert_not recipes(:two).valid?
  end

  test "A recipe must have an associated query" do
    assert_equal recipes(:one).query, "tacos"
    assert recipes(:one).valid?
    recipes(:one).query = nil
    assert_not recipes(:one).valid?
  end

  test "A recipe can have diet information but doesn't have to" do
    assert_equal recipes(:one).diet, "low-fat"
    recipes(:one).diet = nil
    assert recipes(:one).valid?
  end


  test "A recipe can have health information but doesn't have to" do
    assert_equal recipes(:two).health, "peanut-free"
    recipes(:two).health = nil
    assert recipes(:two).valid?
  end
end
