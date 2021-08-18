class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :home
  has_one :review, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_valid?

  def end_date_valid?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end 
end
