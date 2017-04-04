class League < ApplicationRecord
  has_many :teams, through: :competitions
  has_many :competitions
end
