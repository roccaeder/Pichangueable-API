class Field < ApplicationRecord
  belongs_to :user
  belongs_to :ubication

  has_many_attached :images
  belongs_to :user # required: true
  belongs_to :ubication # required: true
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  # has_many :field_images, dependent: :destroy

  validates :field_type, presence: true
  validates :summary, presence: true
  validates :user_id, presence: true
  validates :price_hour, presence: true
  validates :ubication_id, presence: true
  validates :published_at, presence: true
end
