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

  has_many :games



  def games
    Game.where("home_team_id = ? OR away_team_id = ?", "#{self.id}", "#{self.id}")
  end

  def self.matches(team_name)
    all_games = Game.where("home_team_id = ? OR away_team_id = ?", "#{team_name.id}", "#{team_name.id}")
  end
end
