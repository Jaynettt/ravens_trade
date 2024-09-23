class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :goods #, through: :bookings, dependent: :destroy

  validates :first_name, :last_name, :house_name, presence: true
  validates :email, :password, uniqueness: true
  validates :password, length: { minimum: 10 }
end
