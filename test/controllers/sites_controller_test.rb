require 'test_helper'

class SitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sites_index_url
    assert_response :success
  end

  test "should get show" do
    get sites_show_url
    assert_response :success
  end

end
