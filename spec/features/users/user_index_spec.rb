require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'User index page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'user cannot see users page' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content 'Users are not allowed to do this!'
  end

  scenario 'admin sees users page' do
    user = FactoryGirl.create(:user, is_admin: true)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content user.email
  end

end
