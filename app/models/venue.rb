class Venue < ApplicationRecord
  has_many :games, through: :events
  has_many :events
  validates :name, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  def owns_venue?(logged_user)
    current_user == logged_user
  end

end
