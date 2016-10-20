require 'spec_helper'

RSpec.feature 'add more than one tag', type: :feature do
  scenario "it allows input of more than one tag" do
    visit '/links/new'
    fill_in 'url', with: 'http://makersacademy.com'
    fill_in 'title', with: 'Makers Academy'
    #
    fill_in 'tags', with: 'education work'
    #
    click_button "Save"
    #
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'work')
  end
end
