class Field < ApplicationRecord
  belongs_to :user
  belongs_to :ubication

  validates :field_type, presence: true
  validates :summary, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :price_hour, presence: true
  validates :ubication_id, presence: true

  validates :published_at, presence: true
end
