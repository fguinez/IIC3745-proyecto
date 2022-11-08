# frozen_string_literal: true

require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def teardown
    Movie.destroy_all
  end

  test 'Movie con parametros validos' do
    movie = Movie.create(title: 'Matrix', minimum_age: 0, language: 'EN')
    assert_equal(true, movie.valid?)
  end

  # title tests

  test 'Movie con título vacío' do
    movie = Movie.create(title: '', minimum_age: 0, language: 'EN')
    assert_equal(false, movie.valid?)
  end

  test 'Movie con titulo de largo 127' do
    movie = Movie.create(title: '1' * 127, minimum_age: 0, language: 'EN')
    assert_equal(true, movie.valid?)
  end

  test 'Movie con título de largo 128' do
    movie = Movie.create(title: '1' * 128, minimum_age: 0, language: 'EN')
    assert_equal(true, movie.valid?)
  end

  test 'Movie con título de largo 129' do
    movie = Movie.create(title: '1' * 129, minimum_age: 0, language: 'EN')
    assert_equal(false, movie.valid?)
  end

  # minimum_age tests

  test 'Movie sin edad mínima' do
    movie = Movie.create(title: 'Matrix', language: 'EN')
    assert_equal(false, movie.valid?)
  end

  test 'Movie con edad mínima no numérica' do
    movie = Movie.create(title: 'Matrix', minimum_age: 'a', language: 'EN')
    assert_equal(false, movie.valid?)
  end

  test 'Movie con edad mínima no entera' do
    movie = Movie.create(title: 'Matrix', minimum_age: 2.3, language: 'EN')
    assert_equal(false, movie.valid?)
  end

  test 'Movie con edad mínima negativa' do
    movie = Movie.create(title: 'Matrix', minimum_age: -1, language: 'EN')
    assert_equal(false, movie.valid?)
  end

  test 'Movie con edad mínima 1' do
    movie = Movie.create(title: 'Matrix', minimum_age: 1, language: 'EN')
    assert_equal(true, movie.valid?)
  end

  # language tests

  test 'Movie sin idioma' do
    movie = Movie.create(title: 'Matrix', minimum_age: 0)
    assert_equal(false, movie.valid?)
  end

  test 'Movie con idioma no existente' do
    movie = Movie.create(title: 'Matrix', minimum_age: 0, language: 'Jeringozo')
    assert_equal(false, movie.valid?)
  end

  test 'Movie con idioma ES' do
    movie = Movie.create(title: 'Matrix', minimum_age: 0, language: 'ES')
    assert_equal(true, movie.valid?)
  end
end
