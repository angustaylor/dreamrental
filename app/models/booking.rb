class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :home
  has_one :review, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true, if: :end_date_valid?

  def end_date_valid?
    end_date > start_date
  end
end
