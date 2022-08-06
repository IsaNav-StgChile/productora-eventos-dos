class Band < ApplicationRecord
    has_many :concerts, dependent: :destroy

    enum band_type: %i[band girl_band boy_band]
end
