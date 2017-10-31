class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validate the first, last and username
  validates :firstname, presence: true, length: {maximum: 50}
  validates :lastname, presence: true, length: {maximum: 50}
  validates :username, presence: true, length: {maximum: 50}

  has_many :homes
  has_many :appointments
  has_one :image
  include ImageUploader[:image]
end
