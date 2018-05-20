class Booking < ApplicationRecord
  belongs_to :property, dependent: :destroy
  belongs_to :user

  enum status: [:pending, :confirmed, :cancelled]
end
