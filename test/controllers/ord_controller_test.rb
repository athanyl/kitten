require 'test_helper'

class OrdControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ord_new_url
    assert_response :success
  end

  test "should get destroy" do
    get ord_destroy_url
    assert_response :success
  end

end
