require 'rails_helper'

RSpec.describe 'pictures#index', type: :feature do
  before do
    create_list(:picture, 5)
  end

  scenario 'User visits page', js: true do
    visit admin_pictures_path
    expect(page).to have_css('table tbody tr', count: 5)
    expect(page).to have_css('table img', count: 5)
  end
end
