class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :goods #, through: :bookings, dependent: :destroy
  validates :first_name, :last_name, :house_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
