class Game < ApplicationRecord
  belongs_to :league
  has_many :venues, through: :events
end
