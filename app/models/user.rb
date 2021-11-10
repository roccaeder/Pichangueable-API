class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_secure_token
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :fields, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  enum role: {
    user: 0,
    admin: 1
  }
end
