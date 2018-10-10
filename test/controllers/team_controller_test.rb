require 'test_helper'

class TeamControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_index_url
    assert_response :success
  end

  test "should get sec_cau" do
    get team_sec_cau_url
    assert_response :success
  end

end
