class Ubication < ApplicationRecord
  has_many :fields, dependent: :destroy

  validates :district, presence: true
  validates :departament, presence: true
end
