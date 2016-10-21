require 'spec_helper'
require '././app/models/link'

RSpec.feature 'view tags', type: :feature do
  scenario 'can filter links via their tag' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.nasa.com', title: 'NASA', tags: [Tag.first_or_create(name: 'space')])
    visit '/links'
    expect(page.status_code).to be(200)

    fill_in :name, with: 'space'
    click_button 'Filter'

    expect(page).to have_content('NASA')
    expect(page).not_to have_content('Makers Academy')

  end
end
