class Venue < ApplicationRecord
  has_many :games, through: :events
  has_many :events
  validates :name, presence: true
  validates :address, presence: true


  def owns_venue?(logged_user)
    current_user == logged_user
  end

  mount_uploader :photo, PhotoUploader

end
