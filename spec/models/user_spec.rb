describe User do

  let!(:user) do
    User.create(email: 'Dio@test.com', password: '123456',
                password_confirmation: '123456')
  end

  it 'authenticates when valid credentials are used for sign in' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate with incorrect credentials' do
    expect(User.authenticate(user.email, 'wrong_password')).to be nil
  end
end
