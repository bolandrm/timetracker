require 'spec_helper'

describe 'account creation' do
  it 'allows account creation' do
    visit root_path
    click_link 'Create Account'

    fill_in 'Name', with: 'Ryan'
    fill_in 'Email', with: 'ryan@example.com'
    fill_in 'Password', with: 'pw'
    fill_in 'Password confirmation', with: 'pw'
    fill_in 'Subdomain', with: 'test'
    click_button 'Create Account'

    expect(page).to have_content('Signed up successfully')
  end
end
