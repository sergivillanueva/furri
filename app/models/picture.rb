class Picture < ApplicationRecord
  mount_uploader :asset, PictureUploader

  validates :asset, presence: true

  before_save :set_taken_at
  before_save :strip_metadata
  before_save :set_file_size, if: :asset_changed?

  def set_taken_at
    date_time_original = asset.exif['DateTimeOriginal']
    return if date_time_original.nil?

    self.taken_at = DateTime.strptime(date_time_original, '%Y:%m:%d %H:%M:%S')
  end

  def strip_metadata
    asset.strip
  end

  def set_file_size
    return if asset.blank?

    self.file_size = asset.file.size
  end
end
