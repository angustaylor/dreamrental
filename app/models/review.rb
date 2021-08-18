class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, presence: true
  validate :booking_must_have_ended?

  def booking_must_have_ended?
    if booking.end_date < Date.today
    errors.add(:base, 'Sorry but you cannot leave a review as your booking has not happened yet')
    end
  end
end