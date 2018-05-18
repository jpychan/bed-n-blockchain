class User < ApplicationRecord
  has_secure_password
  has_many :properties, dependent: :destroy
  has_many :bookings 
end
