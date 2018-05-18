class Booking < ApplicationRecord
  belongs_to :property, dependent: :destroy
  belongs_to :user
end
