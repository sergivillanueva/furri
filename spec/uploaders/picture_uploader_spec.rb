require 'rails_helper'

RSpec.describe PictureUploader do
  context 'when picture with metadata is uploaded' do
    let (:picture) { create(:picture_with_metadata) }
    let (:image_file) { MiniMagick::Image.open("#{Rails.public_path}#{picture.asset.url}") }

    it 'strips metadata' do
      expect(image_file.exif).to_not be_present
    end
  end
end
