class Good < ApplicationRecord
  belongs_to :user

  has_many :bookings

  has_one_attached :photo


  validates :name, :description, :price, :user_id, presence: true
end
