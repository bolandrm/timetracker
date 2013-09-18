require 'spec_helper'

describe 'user signin' do
  context 'with valid credentials' do
    it 'allows users to signin in' do
      sign_user_in(create(:user))
      expect(page).to have_content('Signed in successfully')
    end
  end

  context 'with invalid credentials' do
    it 'allows users to signin in' do
      user = create(:user, password: 'pw')
      sign_user_in(user, password: 'wrong_password')
      expect(page).to have_content('Invalid email or password')
    end
  end
end

describe 'user signout' do
  it 'allows user to sign out' do
    sign_user_in(create(:user))
    visit root_path
    click_link 'Sign out'
    expect(page).to have_content('Signed out successfully')
  end
end

def sign_user_in(user, opts={})
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: (opts[:password] || user.password)
  click_button 'Sign in'
end
