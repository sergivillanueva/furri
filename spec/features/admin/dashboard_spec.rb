require 'rails_helper'

RSpec.describe 'Dashboard', type: :feature do
  before do
    create_list(:picture, 25)
  end

  scenario 'User visits Dashboard', js: true do
    visit admin_dashboard_path
    expect(page).to have_css('#pictures img')
  end
end
