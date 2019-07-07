require 'rails_helper'

RSpec.describe Picture, type: :model do
  context 'validation tests' do
    it 'ensures asset is present' do
      picture = build(:picture, asset: nil)
      expect(picture.save).to eq(false)
      expect(picture.errors.keys).to include(:asset)
    end

    it 'should save successfully' do
      picture = build(:picture)
      expect(picture.save).to eq(true)
    end
  end

  describe '#taken_at' do
    context 'when picture metadata has date when it was taken' do
      let(:picture) { create(:picture_with_metadata) }
      it 'stores it on taken_at attribute' do
        expect(picture.taken_at).to eq(DateTime.new(2019, 4, 13, 15, 58, 13))
      end
    end

    context 'when picture has no metadata' do
      let(:picture) { create(:picture) }
      it 'leaves taken_at blank' do
        expect(picture.taken_at).to be_blank
      end
    end
  end

  describe '#file_size' do
    let(:picture) { build(:picture) }

    context 'when building new picture' do
      it 'is blank by default' do
        expect(picture.file_size).to be_blank
      end
    end

    context 'when picture is saved' do
      it 'stores its file size' do
        picture.save
        expect(picture.file_size).to eq(195_051)
      end
    end
  end

  describe 'dimensions' do
    let(:picture) { build(:picture) }

    context 'when building new picture' do
      it 'are blank by default' do
        expect(picture.width).to be_blank
        expect(picture.height).to be_blank
      end
    end

    context 'when picture is saved' do
      it 'stores its dimensions' do
        picture.save
        expect(picture.width).to eq(1_600)
        expect(picture.height).to eq(903)
      end
    end
  end

  describe '#landscape?' do
    let(:landscape_picture) { create(:picture) }
    let(:portrait_picture) { create(:street_picture) }

    context 'when picture is landscape' do
      it 'stores true' do
        expect(landscape_picture.landscape?).to be(true)
      end
    end

    context 'when picture is portrait' do
      it 'stores false' do
        expect(portrait_picture.landscape?).to be(false)
      end
    end
  end

  describe '.landscape' do
    context 'when there are 3 pictures and one of them is landscape' do
      before do
        create(:picture)
        create(:fountain_picture)
        create(:street_picture)
      end

      it 'returns one picture' do
        expect(Picture.landscape.size).to eq(1)
      end
    end

  end
end
