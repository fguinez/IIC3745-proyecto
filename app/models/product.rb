class Product < ApplicationRecord
    validates :price, presence: { message: 'El precio no puede estar vacio' },
                      numericality: { only_integer: true, greater_than_or_equal_to: 0}
    validates :category, presence: { message: 'La categoria no puede estar vacia' },
                         inclusion: { in: %w[Bebestible Comestibles, Souvenir],
                            message: '%<value>s no es una categoria valida' }
    validates :weight, numericality: { greater_than: 0 } # gramos
    validates :volume, numericality: { greater_than: 0 } # cc
    validate :validate_category

    def validate_category
        case category
        when 'Bebestible'
            validate :validate_bebestible
        when'Comestibles'
            validate :validate_comestibles
        when 'Souvenir'
            validate :validate_souvenir
        end
    end

    def validate_bebestible
        if volume.nil?
            errors.add(:volume, 'El volumen no puede estar vacio')
        end
        if not weight.nil?
            errors.add(:weight, 'Los bebestibles no deben tener peso')
        end
    end

    def validate_comestibles
        if weight.nil?
            errors.add(:weight, 'El peso no puede estar vacio')
        end
        if not volume.nil?
            errors.add(:volume, 'Los comestibles no deben tener volumen')
        end
    end

    def validate_souvenir
        if weight.nil?
            errors.add(:weight, 'Los souvenirs no deben tener peso')
        end
        if volume.nil?
            errors.add(:volume, 'Los souvenirs no deben tener volumen')
        end
    end
end
