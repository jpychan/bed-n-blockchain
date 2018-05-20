class Property < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  enum property_type: [:none_selected, :shared_room, :private_room, :entire_unit]

  mount_uploader :image, ImageUploader
  validates_processing_of :image
end
