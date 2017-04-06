class Game < ApplicationRecord
  belongs_to :league

  belongs_to :home_team, class_name: "Team" #, foreign_key: "creator_id"
  belongs_to :away_team, class_name: "Team"

  has_many :venues, through: :events
  has_many :events
end
