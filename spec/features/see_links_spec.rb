require 'spec_helper'

RSpec.feature 'see_links', type: :feature do
  scenario 'shows list of links on the homepage' do
    Link.create(url: 'http://google.com', title: 'Google')
    visit '/'

    expect(page.status_code).to eq 200

    within 'ul' do
    expect(page).to have_content('Google')
    end
  end
end
