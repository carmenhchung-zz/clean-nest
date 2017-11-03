class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validate the first, last and username
  validates :firstname, presence: true, length: {maximum: 50}
  validates :lastname, presence: true, length: {maximum: 50}
  validates :username, presence: true, length: {maximum: 50}

  geocoded_by :location
  # Allows geocoder to access the location field in the user model.
  after_validation :geocode, if: :location_changed?
  # Whenever the location is updated, the location will be validated and the latitude and longtitude will be regenerated.

  has_many :homes
  has_many :appointments
  has_one :image
  include ImageUploader[:image]
  include ImageUploader[:identification]

  # def average_rating
  # customer_reviews.count == 0 ? 0 : customer_reviews.average(:star).round(2).to_i
  # end
end
