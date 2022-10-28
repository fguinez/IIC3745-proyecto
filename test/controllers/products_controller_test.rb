# frozen_string_literal: true

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @product = Product.create(name: 'Agua', price: 100, category: 'Bebestible', volume: 100)
  end

  def teardown
    Product.destroy_all
  end

  test 'should create a product' do
    assert_difference 'Product.count' do
      post products_new_url,
           params: { name: 'Agua', price: 1, category: 'Bebestible', volume: 100 }
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

  test 'should get update view' do
    get product_edit_path(id: @product.id)
    assert_response :success
  end

  test 'should not get update view when product dont exist' do
    get product_edit_path(id: @product.id + 1000)
    assert_response :redirect
  end

  test 'should update product values' do
    post product_updated_path,
         params: { id: @product.id, name: 'Agua', price: 5, category: 'Bebestible', volume: 100 }
    edited_product = Product.find(@product.id)
    assert_equal(5, edited_product.price)
  end

  test 'should not update product with invalid values' do
    post product_updated_path,
         params: { id: @product.id, name: 'Agua', price: 100, category: 'Bebestible', volume: -5 }
    product2 = Product.find(@product.id)
    assert_equal(@product.volume, product2.volume)
  end

  test 'should get delete' do
    assert_difference('Product.count', -1) do
      get product_delete_path,
          params: { id: @product.id }
    end
  end
end
