class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true

  has_many :transactions
  has_many :categories
end
