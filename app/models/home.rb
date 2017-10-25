class Home < ApplicationRecord
  belongs_to :user
  has_one :photos
  include ImageUploader[:image]

  def home_image
    if self.image.nil?
      "default_home.svg"
    else
      self.image.url
    end
    # If there is a photo for the home, show it, otherwise show a default home picture.
  end
end
