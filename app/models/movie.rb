# frozen_string_literal: true

class Movie < ApplicationRecord
  has_one_attached :image
  has_many :movie_times, dependent: :destroy

  validates :title, presence: { message: 'El titulo no puede estar vacio' }, length: {
    maximum: 128, message: 'El titulo tiene que ser a lo más 128 caracteres'
  }

  validates :minimum_age, default: 0, numericality: {
    only_integer: true, greater_than_or_equal_to: 0,
    message: 'La edad minima tiene que ser mayor o igual a 0'
  }

  validates :language, presence: { message: 'El idioma no puede estar vacio' },
    inclusion: { in: %w[EN ES], message: '%<value>s no es un idioma válido' }
end
