class Home < ApplicationRecord
  belongs_to :user
  has_one :photos
  include ImageUploader[:image]
end
