require 'rails_helper'

RSpec.describe Picture, type: :model do
  context 'validation test' do
    it 'ensures asset is present' do
      picture = build(:picture, asset: nil)
      expect(picture.save).to eq(false)
    end

    it 'should save successfully' do
      picture = build(:picture)
      expect(picture.save).to eq(true)
    end
  end
end
