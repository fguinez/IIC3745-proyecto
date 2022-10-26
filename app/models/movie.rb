# frozen_string_literal: true

class Movie < ApplicationRecord
  has_one_attached :image
  has_many :movie_times, dependent: :destroy

  validates :title, presence: { message: 'El titulo no puede estar vacio' }, length: {
    maximum: 128, message: 'El titulo tiene que ser a lo más 128 caracteres'
  }
end
