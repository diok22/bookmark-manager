require 'spec_helper'

RSpec.feature 'add two tags', type: :feature do
  scenario "it allows input of more than one tag" do
    visit '/links/new'
    fill_in 'url', with: 'http://makersacademy.com'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags', with: 'education'
    #
    #
    click_button "Save"
    #
    expect(page).to have_content('work')
  end
end
