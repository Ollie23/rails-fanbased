class Venue < ApplicationRecord
  has_many :games, through: :events
  has_many :events
  has_many :attendees, through: :events
  validates :name, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  mount_uploader :photo, PhotoUploader


  def owns_venue?(logged_user)
    current_user == logged_user
  end


  mount_uploader :photo, PhotoUploader



end
