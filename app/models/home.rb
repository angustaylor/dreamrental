class Home < ApplicationRecord
  belongs_to :user
  validates :address, presence: true, uniqueness: {scope: :postcode}
  validates :postcode, presence: true
  validates :bedrooms, presence: true
end
