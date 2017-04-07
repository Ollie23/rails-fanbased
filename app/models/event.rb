class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :game

  def is_attending?(user)
    self.users.pluck(:id).include?(user.id) ? true : false
  end

end
