class Business < ApplicationRecord

    validates :business_name, :address, :city, :state, :zip_code, :latitude, :longtitude, :rating, presence: true
    after_initialize :ensure_photos

    has_many_attached :photos

    has_many :reviews,
        foreign_key: :business_id,
        class_name: :Review

    def ensure_photos
        unless self.photos.attached?
            errors[:photos] << "must be attached"
        end
    end
end
