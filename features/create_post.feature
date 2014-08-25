Feature: Adding posts
  As a user
  I want to be post something
  So that I can share my thoughts with the world

  Scenario: Add a post
    Given I am signed in and on the home page
    When fill in the following:
      | Post | This is my post |
    And I press "Post"
    Then I should be on the home page
    And I should see "This is my post" within the feed