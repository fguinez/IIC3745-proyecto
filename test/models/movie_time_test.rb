# frozen_string_literal: true

require 'test_helper'

# rubocop:disable Layout/ClassLength
class MovieTimeTest < ActiveSupport::TestCase
  def setup
    MovieTime.destroy_all
    Movie.destroy_all
  end

  def teardown
    MovieTime.destroy_all
    Movie.destroy_all
  end

  test 'MovieTime con parametros validos' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(true, movie_time.valid?)
  end

  # room tests

  test 'MovieTime sin sala' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con sala no numérica' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 'a', date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con sala no entera' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 2.3, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con sala negativa' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: -1, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con sala 0' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 0, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con sala 7' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 7, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(true, movie_time.valid?)
  end

  test 'MovieTime con sala 8' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 8, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(true, movie_time.valid?)
  end

  test 'MovieTime con sala 9' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 9, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(false, movie_time.valid?)
  end

  # time tests

  test 'MovieTime sin horario' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  movie_id: movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con horario inválido' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'DESAYUNO', movie_id: movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con horario MATINÉ' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'MATINÉ', movie_id: movie.id)
    assert_equal(true, movie_time.valid?)
  end

  test 'MovieTime con horario TANDA' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(true, movie_time.valid?)
  end

  test 'MovieTime con horario NOCHE' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'NOCHE', movie_id: movie.id)
    assert_equal(true, movie_time.valid?)
  end

  # date_start tests

  test 'MovieTime sin date_start' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 5,
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(false, movie_time.valid?)
  end

  # date_end tests

  test 'MovieTime sin date_end' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 5,
                                  date_start: Date.new(2022, 11, 10),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(false, movie_time.valid?)
  end

  # movie_id tests

  test 'MovieTime sin movie_id' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA')
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con movie_id inexistente' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: 0)
    assert_equal(false, movie_time.valid?)
  end

  # validate_date tests

  test 'MovieTime start > end' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 12),
                                  date_end: Date.new(2022, 11, 10),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime start = end' do
    movie = Movie.create(title: 'Movie')
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 12),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie.id)
    assert_equal(true, movie_time.valid?)
  end

  test 'MovieTime con sala ocupada en dicha fecha' do
    movie = Movie.create(title: 'Movie')
    MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                     date_end: Date.new(2022, 11, 12),
                     time: 'TANDA', movie_id: movie.id)

    movie2 = Movie.create(title: 'Movie2')
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', movie_id: movie2.id)
    assert_equal(false, movie_time.valid?)
  end
end
# rubocop:enable Layout/ClassLength
