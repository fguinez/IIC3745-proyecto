# frozen_string_literal: true

# The model that represents a product
class Product < ApplicationRecord
  validates :price, presence: { message: 'El precio no puede estar vacio' },
                    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :category, presence: { message: 'La categoria no puede estar vacia' },
                       inclusion: { in: %w[Bebestible Comestibles Souvenir],
                                    message: '%<value>s no es una categoria valida' }
  validates :weight, numericality: { greater_than: 0, allow_nil: true } # gramos
  validates :volume, numericality: { greater_than: 0, allow_nil: true } # cc
  validate :validate_category

  def validate_category
    case category
    when 'Bebestible'
      validate_bebestible
    when 'Comestibles'
      validate_comestibles
    when 'Souvenir'
      validate_souvenir
    end
  end

  def validate_bebestible
    errors.add(:volume, 'El volumen no puede estar vacio') if volume.nil?
    errors.add(:weight, 'Los bebestibles no deben tener peso') unless weight.nil?
  end

  def validate_comestibles
    errors.add(:weight, 'El peso no puede estar vacio') if weight.nil?
    errors.add(:volume, 'Los comestibles no deben tener volumen') unless volume.nil?
  end

  def validate_souvenir
    errors.add(:weight, 'Los souvenirs no deben tener peso') unless weight.nil?
    errors.add(:volume, 'Los souvenirs no deben tener volumen') unless volume.nil?
  end
end
