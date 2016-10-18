require 'spec_helper'
require '././app/models/link'

RSpec.feature 'create_links', type: :feature do
  scenario "it adds the site's address and title to my bookmark manager" do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.goole.com'
    fill_in 'title', with: 'Google'
    click_button 'Save'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
