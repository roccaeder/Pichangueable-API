class Ubication < ApplicationRecord
  has_many :fields, dependent: :destroy
end
