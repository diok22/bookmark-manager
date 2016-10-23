require 'spec_helper'

RSpec.feature 'password confirmation' do
  scenario 'mismatching password error' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :email, with: 'test@tester.com'
    fill_in :password, with: 'testpass'
    fill_in :password_confirmation, with: 'testpassed'

    expect {click_button 'Create account'}.to change(User, :count).by(0)
  end

  scenario 'message to user for mismatch password' do
    visit '/users/new'
    fill_in :email, with: 'test@tester.com'
    fill_in :password, with: 'testpass'
    fill_in :password_confirmation, with: 'testpassed'
    click_button 'Create account'

    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
