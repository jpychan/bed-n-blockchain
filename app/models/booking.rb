class Booking < ApplicationRecord
  belongs_to :property, dependent: :destroy
end
