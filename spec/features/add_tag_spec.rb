require 'spec_helper'

RSpec.feature 'add_tag', type: :feature do
  scenario "it adds a single tag to a Link" do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.google.com'
    fill_in 'title', with: 'Google'
    fill_in 'tags', with: 'search engine'
    click_button 'Save'
    link = Link.first
    # expect(current_path).to eq '/links'
    expect(link.tags.map(&:name)).to include('search engine')
  end
end
