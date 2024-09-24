class Booking < ApplicationRecord
  belongs_to :good
  belongs_to :user

  validates :end_date, :status, :start_date, presence: true
  enum status: { pending: 0, accepted: 1, declined: 2 }

  def duration
  (end_date - start_date).to_i
  end

  def calculate_total_price
  good.price * duration
  end
end
