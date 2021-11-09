class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :fields, dependent: :destroy

  validates :name, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, presence: true

  enum role: {
    user: 0,
    admin: 1
  }
end
