class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable, :validatable,
         omniauth_providers: %i[google_oauth2]

  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :fields, dependent: :destroy

  enum role: {
    user: 0,
    admin: 1
  }
end
