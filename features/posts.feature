Feature: Adding posts
  As a user
  I want to be post something
  So that I can share my thoughts with the world

  Scenario: View a post on it's own
    Given a post exists with content "This is my post"
    And I am signed in
    When I go to the page for the post
    Then I should see "This is my post"
