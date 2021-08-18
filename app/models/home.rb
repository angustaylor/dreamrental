class Home < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :address, presence: true
  validates :postcode, presence: true
  validates :country, presence: true
  validates :bedrooms, presence: true
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [:address, :postcode, :country, :city, :region, :country_long],
    using: {
      tsearch: { prefix: true }
    }

  before_validation :create_full_address

  def create_full_address
    self.full_address = "#{address} #{city}, #{country_long}"
  end

  def country_name(country)
    country_name = ISO3166::Country[country]
  end

  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?
end