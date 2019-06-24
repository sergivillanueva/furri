class Picture < ApplicationRecord
  mount_uploader :asset, PictureUploader

  validates :asset, presence: true

  before_save :set_taken_at
  before_save :strip_metadata

  def set_taken_at
    date_time_original = asset.exif['DateTimeOriginal']
    return if date_time_original.nil?

    self.taken_at = DateTime.strptime(date_time_original, '%Y:%m:%d %H:%M:%S')
  end

  def strip_metadata
    asset.strip
  end
end
