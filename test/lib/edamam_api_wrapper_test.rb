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
  # This is recording the response of the method listchannels.
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

  test "a user will be told if their query did not produce any results via a flash notice" do
    VCR.use_cassette("no-results") do
      Edamam_Api_Wrapper.get_recipes("89v90832l")
      assert_equal flash[:notice], "Your search failed to return results. Please try again"
    end
  end
end #THE END!!!!!
  # #
  # test "sending a message to a channel that does not exist will not work" do
  #   VCR.use_cassette("send-msg-bad-channel") do
  #     response = Edamam_Api_Wrapper.sendmsg("no-channel", ":bananadance:")
  #     assert response["ok"] == false
  #     assert response["error"] == "channel_not_found"
  #   end
  # end
  #
  # test "sending a message to a channel without text will not work" do
  #   VCR.use_cassette("send-no-msg") do
  #     response = Edamam_Api_Wrapper.sendmsg("test-api-parens", "")
  #     assert response["ok"] == false
  #     assert response["error"] == "no_text"
  #     response = Edamam_Api_Wrapper.sendmsg("test-api-parens", nil)
  #     assert response["ok"] == false
  #     assert response["error"] == "no_text"
  #   end
  # end
  #
  # test "sending a message with a bad token fails" do
  #   VCR.use_cassette("msg-bad-token") do
  #     response = Edamam_Api_Wrapper.sendmsg("test-api-parens", "failed message", "12345")
  #     assert response["ok"] == false
  #     assert response["error"] == "invalid_auth"
  #     response = Edamam_Api_Wrapper.sendmsg("test-api-parens", "failed message", "")
  #     assert response["ok"] == false
  #     assert response["error"] == "not_authed"
  #   end
  # end
  #

#the real end
