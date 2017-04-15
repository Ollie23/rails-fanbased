class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :fans
  has_many :team, through: :fans

  has_many :attendees
  has_many :events, through: :attendees


  def owns_profile?(profile)
    profile.id == self.profile.id
  end

  def has_photo?
    self.profile.photo.exists?
  end

end
