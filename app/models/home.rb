class Home < ApplicationRecord
  belongs_to :user
  has_one :image
  has_many :appointments
  include ImageUploader[:image]

  geocoded_by :address
  # Allows geocoder to access the address field in the home model.
  after_validation :geocode, if: :address_changed?
  # Whenever the address is updated, the address will be validated and the latitude and longtitude will be regenerated.

end
