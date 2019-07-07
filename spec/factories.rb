FactoryBot.define do
  factory :picture do
    asset do
      file_path = Rails.root.join('spec', 'support', 'pictures', 'sea.jpg')
      Rack::Test::UploadedFile.new(File.open(file_path))
    end
  end

  factory :fountain_picture, class: Picture do
    asset do
      file_path = Rails.root.join('spec', 'support', 'pictures', 'fountain.jpg')
      Rack::Test::UploadedFile.new(File.open(file_path))
    end
  end

  factory :street_picture, class: Picture do
    asset do
      file_path = Rails.root.join('spec', 'support', 'pictures', 'street.jpg')
      Rack::Test::UploadedFile.new(File.open(file_path))
    end
  end

  factory :picture_with_metadata, class: Picture do
    asset do
      file_path = Rails.root.join('spec', 'support', 'pictures', 'with_metadata.jpg')
      Rack::Test::UploadedFile.new(File.open(file_path))
    end
  end
end
