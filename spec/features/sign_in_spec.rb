require 'spec_helper'

RSpec.feature 'sign in', type: :feature do

  let(:user) do
    User.create(email: 'Dio@test.com', password: '123456',
                password_confirmation: '123456')
  end

  scenario "using correct sign in details" do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email:,password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
