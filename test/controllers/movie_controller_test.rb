# frozen_string_literal: true

require 'test_helper'

class MovieControllerTest < ActionDispatch::IntegrationTest
  def setup
    @movie = Movie.create(
      title: 'Matrix Rerecargado (2) final FINAL', minimum_age: 0, language: 'EN'
    )
  end

  def teardown
    MovieTime.destroy_all
    Movie.destroy_all
  end

  # Movie tests

  test 'should get new' do
    get movie_new_url
    assert_response :success
  end

  test 'Posting a new movie EN' do
    assert_difference 'Movie.count' do
      post create_movie_url,
           params: { title: 'Motrix', minimum_age: 0, language: 'EN' }
    end
  end

  test 'Posting a new movie ES' do
    assert_difference 'Movie.count' do
      post create_movie_url,
           params: { title: 'Motrix', minimum_age: 0, language: 'ES' }
    end
  end

  test 'Posting a new movie without params' do
    assert_no_difference 'Movie.count' do
      post create_movie_url,
           params: {}
    end
  end

  # MovieTime tests

  test 'Create movie time' do
    assert_difference 'MovieTime.count' do
      post new_movie_time_url,
           params: {
             movie_time: {
               movie_id: @movie.id, time: 'TANDA', place: 'Santiago',
               date_start: Date.new(2000, 11, 10),
               date_end: Date.new(2000, 11, 12), room: 4
             }
           }
    end
  end

  test 'Create invalid movie time' do
    assert_no_difference 'MovieTime.count' do
      post new_movie_time_url,
           params: {
             movie_time: {
               movie_id: @movie.id, time: 'TANDA', place: 'Santiago',
               date_start: Date.new(2000, 11, 12),
               date_end: Date.new(2000, 11, 10), room: 4
             }
           }
    end
  end

  test 'Create bussy movie time' do
    params = {
      movie_time: {
        movie_id: @movie.id, time: 'TANDA', place: 'Santiago',
        date_start: Date.new(2000, 11, 10),
        date_end: Date.new(2000, 11, 12), room: 4
      }
    }
    post new_movie_time_url,
         params: params

    assert_no_difference 'MovieTime.count' do
      post new_movie_time_url,
           params:
    end
  end

  test 'Get movie list ES' do
    get movies_by_date_url,
        params: {
          date: Date.new(2000, 11, 12),
          age: 18,
          language: 'ES',
          sucursal: 'Santiago'
        }
    assert_response :success
  end

  test 'Get movie list EN' do
    get movies_by_date_url,
        params: {
          date: Date.new(2000, 11, 12),
          age: 18,
          language: 'EN',
          sucursal: 'Santiago'
        }
    assert_response :success
  end

  test 'Get movie list Regional' do
    get movies_by_date_url,
        params: {
          date: Date.new(2000, 11, 12),
          age: 18,
          language: 'EN',
          sucursal: 'Regional'
        }
    assert_response :success
  end
end
