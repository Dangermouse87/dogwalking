class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  geocoded_by :location
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :dogsittings, dependent: :destroy
  has_many :bookings_as_dogsitter, through: :dogsittings, source: :bookings
  has_many :pets, dependent: :destroy
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { in: 6..20 }
  after_validation :geocode, if: :will_save_change_to_location?
end
