class Team < ApplicationRecord
  has_many :users, through: :fans
  has_many :fans
  has_many :leagues, through: :competitions
  has_many :competitions

  validates :name, presence: true
  validates :location, presence: true

  def is_supporter?(team)
    self.users.pluck(:id).include?(team.id) ? true : false
  end
end
