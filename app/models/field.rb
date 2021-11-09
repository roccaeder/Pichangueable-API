class Field < ApplicationRecord
  has_many_attached :images
  belongs_to :user # required: true
  belongs_to :ubication # required: true
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  # has_many :field_images, dependent: :destroy
end
