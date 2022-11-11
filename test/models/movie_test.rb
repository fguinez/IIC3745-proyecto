# frozen_string_literal: true

require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def teardown
    Movie.destroy_all
  end

  test 'Movie con parametros validos' do
    movie = Movie.create(title: 'Matrix', age_restriction: 'no', language: 'EN')
    assert_equal(true, movie.valid?)
  end

  # title tests

  test 'Movie con título vacío' do
    movie = Movie.create(title: '', age_restriction: 'no', language: 'EN')
    assert_equal(false, movie.valid?)
  end

  test 'Movie con titulo de largo 127' do
    movie = Movie.create(title: '1' * 127, age_restriction: 'no', language: 'EN')
    assert_equal(true, movie.valid?)
  end

  test 'Movie con título de largo 128' do
    movie = Movie.create(title: '1' * 128, age_restriction: 'no', language: 'EN')
    assert_equal(true, movie.valid?)
  end

  test 'Movie con título de largo 129' do
    movie = Movie.create(title: '1' * 129, age_restriction: 'no', language: 'EN')
    assert_equal(false, movie.valid?)
  end

  # age_restriction tests

  test 'Movie sin el capo restricción de edad' do
    movie = Movie.create(title: 'Matrix', language: 'EN')
    assert_equal(false, movie.valid?)
  end

  test 'Movie con restricción de edad inválida' do
    movie = Movie.create(title: 'Matrix', age_restriction: 'a', language: 'EN')
    assert_equal(false, movie.valid?)
  end

  test 'Movie con restricción de edad' do
    movie = Movie.create(title: 'Matrix', age_restriction: 'si', language: 'EN')
    assert_equal(true, movie.valid?)
  end

  # language tests

  test 'Movie sin idioma' do
    movie = Movie.create(title: 'Matrix', age_restriction: 'no')
    assert_equal(false, movie.valid?)
  end

  test 'Movie con idioma no existente' do
    movie = Movie.create(title: 'Matrix', age_restriction: 'no', language: 'Jeringozo')
    assert_equal(false, movie.valid?)
  end

  test 'Movie con idioma ES' do
    movie = Movie.create(title: 'Matrix', age_restriction: 'no', language: 'ES')
    assert_equal(true, movie.valid?)
  end
end
