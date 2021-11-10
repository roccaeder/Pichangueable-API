class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :field

  validates :start_date_hour, presence: true
  validates :end_date_hour, presence: true
  validates :total, presence: true
  validates :user_id, presence: true
  validates :field_id, presence: true
end
