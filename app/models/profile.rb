class Profile < ApplicationRecord
  belongs_to :user
    mount_uploader :photo, PhotoUploader
  validates :username, :first_name, :last_name, presence: true
end
