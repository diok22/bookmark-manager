require 'spec_helper'
require '././app/models/link'

RSpec.feature 'see_links', type: :feature do
  scenario 'shows list of links on the homepage' do
    visit '/links'
    Link.create(url: 'http://google.com', title: 'Google')
    # within 'ul#links' do
    expect(page).to have_content('Google')
    # end
  end
end
