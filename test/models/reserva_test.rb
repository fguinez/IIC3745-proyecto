# frozen_string_literal: true

require 'test_helper'

# rubocop:disable Metrics/ClassLength
class ReservaTest < ActiveSupport::TestCase
  def setup
    Reserva.destroy_all
    movie = Movie.create(title: 'Movie', minimum_age: 0, language: 'EN')
    MovieTime.create(room: 5, date_start: Date.new(2022, 10, 10),
                     date_end: Date.new(2022, 10, 12), time: 'TANDA',
                     place: 'Santiago', movie_id: movie.id)
  end

  def teardown
    Reserva.destroy_all
    MovieTime.destroy_all
    Movie.destroy_all
  end

  test 'Reserva creada con parametros validos' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), asiento: 10, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(true, reserva.valid?)
  end

  # sala tests

  test 'Reserva sin sala' do
    reserva = Reserva.create(fecha: Date.new(2022, 10, 11), asiento: 10, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  test 'Reserva con sala negativa' do
    reserva = Reserva.create(sala: -1, fecha: Date.new(2022, 10, 11), asiento: 10, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  test 'Reserva con sala 0' do
    reserva = Reserva.create(sala: 0, fecha: Date.new(2022, 10, 11), asiento: 10, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  test 'Reserva con sala > 8' do
    reserva = Reserva.create(sala: 9, fecha: Date.new(2022, 10, 11), asiento: 10, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  # Fecha tests

  test 'Reserva sin fecha' do
    reserva = Reserva.create(sala: 5, asiento: 10, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  test 'Reserva con fecha inválida' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 13), asiento: 10, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  # Asientos tests

  test 'Reserva sin asiento' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  test 'Reserva con asiento no numerico' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), asiento: 'a',
                             horario: 'TANDA', name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  test 'Reserva con asiento no entero' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), asiento: 10.2,
                             horario: 'TANDA', name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  test 'Reserva con asiento negativo' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), asiento: -1,
                             horario: 'TANDA', name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  test 'Reserva con asiento 0' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), asiento: 0, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  test 'Reserva con asiento 1' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), asiento: 1, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(true, reserva.valid?)
  end

  test 'Reserva con asiento 48' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), asiento: 48, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(true, reserva.valid?)
  end

  test 'Reserva con asiento 49' do
    reserva = Reserva.create(sala: 1, fecha: Date.new(2022, 10, 11), asiento: 49, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  test 'Reserva con asiento 50' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), asiento: 49, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  # Horarios tests

  test 'Reserva sin horario' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), asiento: 10,
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  test 'Reserva con horario inválido' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), asiento: 10, horario: 'ONCE',
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end

  # name tests

  test 'Reserva sin nombre' do
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), asiento: 10, horario: 'TANDA')
    assert_equal(false, reserva.valid?)
  end

  # validate_movie_time_exist tests

  test 'Reserva en un lugar sin película' do
    MovieTime.destroy_all
    reserva = Reserva.create(sala: 5, fecha: Date.new(2022, 10, 11), asiento: 10, horario: 'TANDA',
                             name: 'Pedro')
    assert_equal(false, reserva.valid?)
  end
end
# rubocop:enable Metrics/ClassLength
