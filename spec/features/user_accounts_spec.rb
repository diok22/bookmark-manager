require 'spec_helper'

RSpec.feature 'user account management' do
  scenario 'a new user can sign up' do
    # user counter will increase by 1
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Succesful login, test@tester.com')
    expect(User.first.email).to eq('test@tester.com')
  end
end
