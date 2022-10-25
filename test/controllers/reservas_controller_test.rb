# frozen_string_literal: true

require 'test_helper'

class ReservasControllerTest < ActionDispatch::IntegrationTest
  def setup
    movie = Movie.create(title: 'Matrix')
    MovieTime.create(room: 5, date_start: Date.new(2000, 11, 10),
                     date_end: Date.new(2000, 11, 12), time: 'TANDA',
                     movie_id: movie.id)
  end

  def teardown
    Reserva.destroy_all
    MovieTime.destroy_all
    Movie.destroy_all
  end
  test 'Posting a new reserva' do
    assert_difference 'Reserva.count' do
      post new_reserva_url(5, '2000-11-12', 'TANDA'),
           params: { reservation_seats: 'C-3', name: 'Diego' }
    end
  end

  test 'Posting a invalid room for reserva' do
    assert_no_difference 'Reserva.count' do
      post new_reserva_url(4, '2000-11-12', 'TANDA'),
           params: { reservation_seats: 'C-4', name: 'Diego' }
    end
  end

  test 'Posting a reserva without name' do
    assert_no_difference 'Reserva.count' do
      post new_reserva_url(5, '2000-11-12', 'TANDA'),
           params: { reservation_seats: 'C-4', name: '' }
    end
  end

  test 'Posting a reserva without seat' do
    assert_no_difference 'Reserva.count' do
      post new_reserva_url(5, '2000-11-12', 'TANDA'),
           params: { reservation_seats: '', name: 'Diego' }
    end
  end

  test 'Getting a reserva' do
    get new_reserva_url(5, '2000-11-12', 'TANDA'),
           params: { reservation_seats: 'C-3', name: 'Diego' }
    assert_response :success
  end

  test 'Posting a reserva with invalid seat' do
    assert_difference("Reserva.count", difference=2) do
      post new_reserva_url(5, '2000-11-12', 'TANDA'),
           params: { reservation_seats: 'C-9, C-10', name: 'Diego' }
    end
  end
end
