class Review < ApplicationRecord
  belongs_to :field
  belongs_to :user

  validates :comment, length: { maximum: 500 }
  validates :field_id, presence: true
  validate :validate_rating

  def validate_rating
    return unless rating

    errors.add(:rating, "This is not a valid rating") unless rating >= 0 && rating <= 10
  end
end
