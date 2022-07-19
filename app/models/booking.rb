class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dogsitting
  validates :starts_at, :ends_at, :status, presence: true
  enum status: { pending: 0, accepted: 1, rejected: 2 }
end
