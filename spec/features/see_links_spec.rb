require 'spec_helper'

RSpec.feature 'see_links', type: :feature do
  scenario 'shows list of links on the homepage' do
    visit '/'
    expect(page).to have_link
  end
end
