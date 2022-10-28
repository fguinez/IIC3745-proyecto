require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get products_create_url
    assert_response :success
  end

  test "should get read" do
    get products_read_url
    assert_response :success
  end

  test "should get update" do
    get products_update_url
    assert_response :success
  end

  test "should get delete" do
    get products_delete_url
    assert_response :success
  end
end
