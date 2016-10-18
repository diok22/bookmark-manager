require 'spec_helper'
require '././app/models/link'

RSpec.feature 'see_links', type: :feature do
  scenario 'shows list of links on the homepage' do
    Link.create(url: 'http://google.com', title: 'Google')
    visit '/links'
    # expect(page.status_code).to be(200)
    within 'ul#links' do
    expect(page).to have_content('Google')
    end
  end
end
