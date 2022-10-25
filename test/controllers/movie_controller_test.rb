# frozen_string_literal: true

require 'test_helper'

class MovieControllerTest < ActionDispatch::IntegrationTest
  def setup; end

  def teardown
    MovieTime.destroy_all
    Movie.destroy_all
  end

  test 'should get new' do
    get movie_new_url
    assert_response :success
  end

  test 'Posting a new movie' do
    assert_difference 'Movie.count' do
      post create_movie_url,
          params: { title: 'Motrix' }
    end
  end

  test 'Posting a new movie without title' do
    assert_no_difference 'Movie.count' do
      post create_movie_url,
          params: { }
    end
  end

  test 'Create movie time' do
    movie = Movie.create(title: 'Matrix Rerecargado (2) final FINAL')
    assert_difference 'MovieTime.count' do
      post new_movie_time_url,
          params: {
            movie_time: {
              movie_id: movie.id, time: 'TANDA',
              date_start: Date.new(2000, 11, 10),
              date_end: Date.new(2000, 11, 12), room: 4
            }
          }
    end
  end

  test 'Create invalid movie time' do
    movie = Movie.create(title: 'Matrix Rerecargado (2) final FINAL')
    assert_no_difference 'MovieTime.count' do
      post new_movie_time_url,
          params: {
            movie_time: {
              movie_id: movie.id, time: 'TANDA',
              date_start: Date.new(2000, 11, 12),
              date_end: Date.new(2000, 11, 10), room: 4
            }
          }
    end
  end

  test 'Create bussy movie time' do
    movie = Movie.create(title: 'Matrix Rerecargado (2) final FINAL')
    params = {
      movie_time: {
        movie_id: movie.id, time: 'TANDA',
        date_start: Date.new(2000, 11, 10),
        date_end: Date.new(2000, 11, 12), room: 4
      }
    }
    post new_movie_time_url,
          params: params
    
    assert_no_difference 'MovieTime.count' do
      post new_movie_time_url,
          params: params
    end
  end

  test 'Get movie list' do
    get movies_by_date_url,
      params: {
        date: Date.new(2000, 11, 12)
      }
    assert_response :success
  end
end
