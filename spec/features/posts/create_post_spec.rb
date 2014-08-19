require "spec_helper"

include Warden::Test::Helpers
Warden.test_mode!

# Feature: User edit
#   As a user
#   I want to edit my user profile
#   So I can change my email address
feature 'Post create', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User creates a post
  # Note - this feature is duplicated in cucumber - so I can compare the rspec and cucumber for integration testing
  scenario 'user creates a post' do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    visit root_path
    fill_in 'Post', :with => 'This is my post'
    click_button 'Create Post'
    expect(page).to have_content 'This is my post'
  end
end
