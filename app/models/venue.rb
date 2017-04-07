class Venue < ApplicationRecord
  has_many :games, through: :events
  has_many :events
  validates :name, presence: true
  validates :address, presence: true


  def owns_venue?(current_user)
    self.user == current_user
  end

end
