class Home < ApplicationRecord
  belongs_to :user
  validates :address, presence: true
  validates :postcode, presence: true
  validates :bedrooms, presence: true
  has_many_attached :photos
end
