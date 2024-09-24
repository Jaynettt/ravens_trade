class Good < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :description, :price, :user_id, presence: true
end
