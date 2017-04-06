class Fan < ApplicationRecord
  belongs_to :user
  belongs_to :team

  def is_fan?(user)
    self.users.pluck(:id).include?(user.id)
  end
end
