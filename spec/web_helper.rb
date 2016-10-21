def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :user_name, with: 'Tester'
  fill_in :email, with: 'test@tester.com'
  fill_in :password, with: 'testpass'
  click_button 'Create account'
end
