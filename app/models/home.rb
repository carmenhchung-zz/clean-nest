class Home < ApplicationRecord
  belongs_to :user
  has_one :image
  has_many :appointments
  include ImageUploader[:image]

  geocoded_by :address
  # Allows geocoder to access the address field in the home model.
  after_validation :geocode, if: :address_changed?
  # Whenever the address is updated, the address will be validated and the latitude and longtitude will be regenerated.

  def home_image
    if self.image.nil?
      "default_home.svg"
    else
      self.image.url
    end
    # If there is a photo for the home, show it, otherwise show a default home picture.
  end
end
