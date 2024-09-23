class Booking < ApplicationRecord
  belongs_to :good
  belongs_to :user

  validates :duration, :status, :start_date, presence: true
  enum status: { pending, accepted, declined }
end
