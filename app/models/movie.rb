# frozen_string_literal: true

# Model that represents a movie
class Movie < ApplicationRecord
  has_one_attached :image
  has_many :movie_times, dependent: :destroy

  validates :title, presence: { message: 'El titulo no puede estar vacio' }, length: {
    maximum: 128, message: 'El titulo tiene que ser a lo más 128 caracteres'
  }

  validates :age_restriction, presence: { message: 'La restricción de edad no puede estar vacía' },
                              inclusion: { in: %w[si no],
                                           message: '%<value>s no es una opción válida' }

  validates :language, presence: { message: 'El idioma no puede estar vacio' },
                       inclusion: { in: %w[EN ES], message: '%<value>s no es un idioma válido' }

  def title_with_language
    "#{title} (#{language})"
  end
end
