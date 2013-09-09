require 'spec_helper'

describe 'account creation' do
  it 'allows account creation' do
    visit root_path
    click_link 'Create Account'

    #fill_in :name, with: 'Ryan'
    #fill_in :email, with: 'ryan@example.com'
    #fill_in :password, with: 'pw'
    #fill_in :password_confirmation, with: 'pw'
    fill_in :subdomain, with: 'test'
    click_button :create_account

    expect(page).to have_content('Signed up successfully')
  end
end
