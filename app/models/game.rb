class Game < ApplicationRecord
  belongs_to :league
<<<<<<< HEAD
  belongs_to :home_team, class_name: "Team" #, foreign_key: "creator_id"
  belongs_to :away_team, class_name: "Team"
=======
  has_many :venues, through: :events
>>>>>>> bf82286e5f50aadf59f1d174222287db0899c5d3
end
