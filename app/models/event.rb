class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :game

  has_many :attendees

  def is_attending?(user)
    self.attendees.pluck(:user_id).include?(user.id) ? true : false
  end


  def supporters
    attending_users = (self.attendees.map {|a| a.user})
    home_team = 0
    away_team = 0
    attending_users.each do |user|
      if user.team.include?(self.game.home_team)
        home_team += 1
      elsif user.team.include?(self.game.away_team)
        away_team += 1
      end
    end
     @array = {self.game.home_team.name => home_team,
                self.game.away_team.name => away_team}
  end


end
