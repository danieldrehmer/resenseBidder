require 'test_helper'

class AuctionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get auction_index_url
    assert_response :success
  end

end
