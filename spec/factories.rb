FactoryBot.define do
  factory :picture do
    asset { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/pictures/sea.jpg'))) }
  end

  factory :picture_with_metadata, class: Picture do
    asset { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/pictures/with_metadata.jpg'))) }
  end
end
