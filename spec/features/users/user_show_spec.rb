require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'User profile page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  scenario 'user cannot see profiles' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    expect(page).to have_content 'Users are not allowed to do this!'
  end

  scenario 'admin can see profiles' do
    user = FactoryGirl.create(:user, is_admin: true)
    login_as(user, scope: :user)
    visit user_path(user)
    expect(page).to have_content 'User'
    expect(page).to have_content user.email
  end

end
