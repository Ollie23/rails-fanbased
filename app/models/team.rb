class Team < ApplicationRecord
  has_many :users, through: :fans
  has_many :fans
  has_many :leagues, through: :competitions
  has_many :competitions
  has_many :games, through: :playing_teams
  has_many :playing_teams

  validates :name, presence: true
  validates :location, presence: true
end
