require 'test_helper'

class TimerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get timer_show_url
    assert_response :success
  end

end
