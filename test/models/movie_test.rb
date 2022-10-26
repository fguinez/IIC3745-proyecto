# frozen_string_literal: true

require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def teardown
    Movie.destroy_all
  end

  test 'Movie con parametros validos' do
    movie = Movie.create(title: 'Matrix')
    assert_equal(true, movie.valid?)
  end

  test 'Movie con título vacío' do
    movie = Movie.create(title: '')
    assert_equal(false, movie.valid?)
  end

  test 'Movie con titulo de largo 127' do
    movie = Movie.create(title: '1' * 127)
    assert_equal(true, movie.valid?)
  end

  test 'Movie con título de largo 128' do
    movie = Movie.create(title: '1' * 128)
    assert_equal(true, movie.valid?)
  end

  test 'Movie con título de largo 129' do
    movie = Movie.create(title: '1' * 129)
    assert_equal(false, movie.valid?)
  end
end
