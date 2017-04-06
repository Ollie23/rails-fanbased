class League < ApplicationRecord
  has_many :teams, through: :competitions
  has_many :competitions

  has_many :games
end
