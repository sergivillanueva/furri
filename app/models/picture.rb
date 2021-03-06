class Picture < ApplicationRecord
  mount_uploader :asset, PictureUploader

  validates :asset, presence: true

  before_save :set_taken_at
  before_save :strip_metadata
  before_save :set_file_size, if: :asset_changed?
  before_save :set_dimensions, if: :asset_changed?
  before_save :set_landscape, if: :asset_changed?

  scope :landscape, -> { where(landscape: true) }
  scope :with_taken_at, -> { where.not(taken_at: nil) }

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

  def set_dimensions
    return if asset.blank?

    dimensions = asset.dimensions
    self.width = dimensions[0]
    self.height = dimensions[1]
  end

  def set_landscape
    return if asset.blank?

    self.landscape = width > height
  end


end
