FactoryBot.define do
  factory :picture do
    asset { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/pictures/sea.jpg'))) }
  end
end
