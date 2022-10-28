# frozen_string_literal: true

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @product = Product.create(price: 100, category: 'Bebestible', volume: 100)
  end

  def teardown
    Product.destroy_all
  end

  test 'should create a product' do
    assert_difference 'Product.count' do
      post products_new_url,
           params: { price: 1, category: 'Bebestible', volume: 100 }
    end
  end

  test 'should not create a invalid product' do
    assert_no_difference 'Product.count' do
      post products_new_url,
           params: { price: 1, category: 'Bebestible' }
    end
  end

  test 'should get list of products' do
    get products_by_category_url
    assert_response :success
  end

  test 'should get a filtered list of products' do
    get products_by_category_url,
        params: { Bebestible: 1, Comestibles: 1, Souvenir: 1 }
    assert_response :success
  end

  # test "should get update" do
  #   get products_update_url
  #   assert_response :success
  # end

  test 'should get delete' do
    assert_difference('Product.count', -1) do
      get product_delete_path,
          params: { id: @product.id }
    end
  end
end
