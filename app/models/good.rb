class Good < ApplicationRecord
  belongs_to :user

  validates :name, :description, :price, :user_id, presence: true
end
