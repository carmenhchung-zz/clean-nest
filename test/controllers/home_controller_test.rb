require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get new" do
    get home_new_url
    assert_response :success
  end

  test "should get create" do
    get home_create_url
    assert_response :success
  end

  test "should get listing" do
    get home_listing_url
    assert_response :success
  end

  test "should get hourly_rate" do
    get home_hourly_rate_url
    assert_response :success
  end

  test "should get description" do
    get home_description_url
    assert_response :success
  end

  test "should get image_data" do
    get home_image_data_url
    assert_response :success
  end

  test "should get location" do
    get home_location_url
    assert_response :success
  end

  test "should get update" do
    get home_update_url
    assert_response :success
  end

end
