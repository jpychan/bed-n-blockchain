class Booking < ApplicationRecord
  belongs_to :property
  belongs_to :user

  enum status: [:pending, :confirmed, :cancelled]
end
