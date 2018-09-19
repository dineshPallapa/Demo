class Survey < ApplicationRecord
  belongs_to :deal
  belongs_to :user

  mount_uploader :avatar, AvatarUploader
end
