class Venue < ApplicationRecord
  has_many :games, through: :events
  has_many :events
  validates :name, presence: true
  validates :address, presence: true
end
