class Picture < ApplicationRecord
  mount_uploader :asset, PictureUploader

  validates :asset, presence: true
end
