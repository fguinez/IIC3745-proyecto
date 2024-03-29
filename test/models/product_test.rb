# frozen_string_literal: true

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def teardown
    Product.destroy_all
  end

  # name tests

  test 'Product sin nombre' do
    product = Product.create(price: 100, category: 'Bebestible', volume: 100)
    assert_equal(false, product.valid?)
  end

  # price tests

  test 'Product sin precio' do
    product = Product.create(name: 'Agua', category: 'Bebestible', volume: 100)
    assert_equal(false, product.valid?)
  end

  test 'Product con precio negativo' do
    product = Product.create(name: 'Agua', price: -1, category: 'Bebestible', volume: 100)
    assert_equal(false, product.valid?)
  end

  test 'Product con precio 0' do
    product = Product.create(name: 'Agua', price: 0, category: 'Bebestible', volume: 100)
    assert_equal(true, product.valid?)
  end

  test 'Product con precio 1' do
    product = Product.create(name: 'Agua', price: 1, category: 'Bebestible', volume: 100)
    assert_equal(true, product.valid?)
  end

  test 'Product con precio decimal' do
    product = Product.create(name: 'Agua', price: 1.5, category: 'Bebestible', volume: 100)
    assert_equal(false, product.valid?)
  end

  # category tests

  test 'Product sin categoria' do
    product = Product.create(name: 'Agua', price: 100, volume: 100)
    assert_equal(false, product.valid?)
  end

  test 'Product válido con categoria Bebestible' do
    product = Product.create(name: 'Agua', price: 100, category: 'Bebestible', volume: 100)
    assert_equal(true, product.valid?)
  end

  test 'Product válido con categoria Comestibles ' do
    product = Product.create(name: 'Agua', price: 100, category: 'Comestibles', weight: 100)
    assert_equal(true, product.valid?)
  end

  test 'Product válido con categoria Souvenir' do
    product = Product.create(name: 'Agua', price: 100, category: 'Souvenir')
    assert_equal(true, product.valid?)
  end

  test 'Product con categoria inválida' do
    product = Product.create(name: 'Agua', price: 100, category: 'Aire')
    assert_equal(false, product.valid?)
  end

  # weight tests

  test 'Product con peso negativo' do
    product = Product.create(name: 'Agua', price: 100, category: 'Comestibles', weight: -1)
    assert_equal(false, product.valid?)
  end

  test 'Product con peso 0' do
    product = Product.create(name: 'Agua', price: 100, category: 'Comestibles', weight: 0)
    assert_equal(false, product.valid?)
  end

  test 'Product con peso decimal' do
    product = Product.create(name: 'Agua', price: 100, category: 'Comestibles', weight: 1.1)
    assert_equal(true, product.valid?)
  end

  # volume tests

  test 'Product con volumen negativo' do
    product = Product.create(name: 'Agua', price: 100, category: 'Bebestible', volume: -1)
    assert_equal(false, product.valid?)
  end

  test 'Product con volumen 0' do
    product = Product.create(name: 'Agua', price: 100, category: 'Bebestible', volume: 0)
    assert_equal(false, product.valid?)
  end

  test 'Product con volumen valido decimal' do
    product = Product.create(name: 'Agua', price: 100, category: 'Bebestible', volume: 1.1)
    assert_equal(true, product.valid?)
  end

  # validate_category tests

  test 'Product con categoria Bebestible y sin volumen' do
    product = Product.create(name: 'Agua', price: 100, category: 'Bebestible')
    assert_equal(false, product.valid?)
  end

  test 'Product con categoria Bebestible y con peso' do
    product = Product.create(name: 'Agua', price: 100, category: 'Bebestible', volume: 100,
                             weight: 100)
    assert_equal(false, product.valid?)
  end

  test 'Product con categoria Comestibles y sin peso' do
    product = Product.create(name: 'Agua', price: 100, category: 'Comestibles')
    assert_equal(false, product.valid?)
  end

  test 'Product con categoria Comestibles y con volumen' do
    product = Product.create(name: 'Agua', price: 100, category: 'Comestibles', weight: 100,
                             volume: 100)
    assert_equal(false, product.valid?)
  end

  test 'Product con categoria Souvenir y con peso' do
    product = Product.create(name: 'Agua', price: 100, category: 'Souvenir', weight: 100)
    assert_equal(false, product.valid?)
  end

  test 'Product con categoria Souvenir y con volumen' do
    product = Product.create(name: 'Agua', price: 100, category: 'Souvenir', volume: 100)
    assert_equal(false, product.valid?)
  end
end
