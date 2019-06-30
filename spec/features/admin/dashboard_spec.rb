require 'rails_helper'

RSpec.describe 'Dashboard', type: :feature do
  before do
    create_list(:picture, 25)
  end

  let(:file_path) do
    Rails.root.join('spec', 'support', 'pictures', 'fountain.jpg')
  end

  let(:other_file_path) do
    Rails.root.join('spec', 'support', 'pictures', 'street.jpg')
  end

  scenario 'User visits Dashboard', js: true do
    visit admin_dashboard_path
    expect(page).to have_css('#pictures img')
    expect(page).to have_css('form#new_picture')
  end

  scenario 'User uploads file', js: true do
    visit admin_dashboard_path
    page.attach_file('picture_asset', file_path)
    expect { click_button 'Create Picture' }.to change { Picture.count }.by(1)
  end

  scenario 'User uploads blank file', js: true do
    visit admin_dashboard_path
    expect { click_button 'Create Picture' }.to change { Picture.count }.by(0)
  end

  scenario 'User uploads multiple files', js: true do
    visit admin_dashboard_path
    pictures_count = Picture.count
    page.attach_file('picture_asset', [file_path, other_file_path])
    click_button 'Create Picture'
    expect(Picture.count).to eq(pictures_count + 2)
  end

end
