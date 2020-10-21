class Home < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :address, presence: true
  validates :postcode, presence: true
  validates :country, presence: true
  validates :bedrooms, presence: true
  has_many_attached :photos

  geocoded_by :address
  # def full_address
  #   "#{:address}, #{:country} #{:postcode}"
  # end
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [:address, :postcode, :country],
    using: {
      tsearch: { prefix: true }
    }
end
