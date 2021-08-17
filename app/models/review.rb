class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, presence: true
  validates :review_must_have_ended, presence: true

  def review_must_have_ended
    booking.end_date < Date.today
    errors.add(:base, 'Sorry but you cannot leave a review as your booking has not happened yet')
  end
end