require 'test_helper'

class CartersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get carters_show_url
    assert_response :success
  end

  test "should get index" do
    get carters_index_url
    assert_response :success
  end

  test "should get new" do
    get carters_new_url
    assert_response :success
  end

  test "should get create" do
    get carters_create_url
    assert_response :success
  end

  test "should get edit" do
    get carters_edit_url
    assert_response :success
  end

  test "should get update" do
    get carters_update_url
    assert_response :success
  end

  test "should get destroy" do
    get carters_destroy_url
    assert_response :success
  end

end
