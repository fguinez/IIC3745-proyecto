# frozen_string_literal: true

require 'test_helper'

# rubocop:disable Metrics/ClassLength
class MovieTimeTest < ActiveSupport::TestCase
  def setup
    MovieTime.destroy_all
    Movie.destroy_all
    @movie = Movie.create(title: 'Movie', age_restriction: 'no', language: 'EN')
  end

  def teardown
    MovieTime.destroy_all
    Movie.destroy_all
  end

  test 'MovieTime con parametros validos' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(true, movie_time.valid?)
  end

  # room tests

  test 'MovieTime sin sala' do
    movie_time = MovieTime.create(date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con sala no numérica' do
    movie_time = MovieTime.create(room: 'a', date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con sala no entera' do
    movie_time = MovieTime.create(room: 2.3, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con sala negativa' do
    movie_time = MovieTime.create(room: -1, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con sala 0' do
    movie_time = MovieTime.create(room: 0, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con sala 7' do
    movie_time = MovieTime.create(room: 7, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(true, movie_time.valid?)
  end

  test 'MovieTime con sala 8' do
    movie_time = MovieTime.create(room: 8, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(true, movie_time.valid?)
  end

  test 'MovieTime con sala 9 (inválida)' do
    movie_time = MovieTime.create(room: 9, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  # time tests

  test 'MovieTime sin horario' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con horario inválido' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'DESAYUNO',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con horario MATINÉ' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'MATINÉ',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(true, movie_time.valid?)
  end

  test 'MovieTime con horario TANDA' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(true, movie_time.valid?)
  end

  test 'MovieTime con horario NOCHE' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'NOCHE',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(true, movie_time.valid?)
  end

  # date_start tests

  test 'MovieTime sin date_start' do
    movie_time = MovieTime.create(room: 5,
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  # date_end tests

  test 'MovieTime sin date_end' do
    movie_time = MovieTime.create(room: 5, place: 'Santiago',
                                  date_start: Date.new(2022, 11, 10),
                                  time: 'TANDA', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  # place tests

  test 'MovieTime sin place' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con place Regional' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Regional', movie_id: @movie.id)
    assert_equal(true, movie_time.valid?)
  end

  test 'MovieTime con place inválido' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Endor', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  # movie_id tests

  test 'MovieTime sin movie_id' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12),
                                  time: 'TANDA', place: 'Santiago')
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime con movie_id inexistente' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: 0)
    assert_equal(false, movie_time.valid?)
  end

  # validate_date tests

  test 'MovieTime start > end' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 12),
                                  date_end: Date.new(2022, 11, 10), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(false, movie_time.valid?)
  end

  test 'MovieTime start = end' do
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 12),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: @movie.id)
    assert_equal(true, movie_time.valid?)
  end

  test 'MovieTime con sala ocupada en dicha fecha' do
    MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                     date_end: Date.new(2022, 11, 12), time: 'TANDA',
                     place: 'Santiago', movie_id: @movie.id)

    movie2 = Movie.create(title: 'Movie2', age_restriction: 'no', language: 'EN')
    movie_time = MovieTime.create(room: 5, date_start: Date.new(2022, 11, 10),
                                  date_end: Date.new(2022, 11, 12), time: 'TANDA',
                                  place: 'Santiago', movie_id: movie2.id)
    assert_equal(false, movie_time.valid?)
  end
end
# rubocop:enable Metrics/ClassLength
