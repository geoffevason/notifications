include Warden::Test::Helpers
Warden.test_mode!

# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Home page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Sign up"
  scenario 'visit the home page when signed out' do
    visit root_path
    expect(page).to have_content 'Sign up'
  end

  # Scenario: Visit the home page
  #   Given I am signed in
  #   When I visit the home page
  #   Then I see the feed
  scenario 'visit the home page when signed in' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit root_path
    expect(page).to have_css('#feed')
  end

end
