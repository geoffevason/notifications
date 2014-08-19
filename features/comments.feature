Feature: Adding comments
  As a user
  I want to be comment on a post
  So that I can start a discussion

  Scenario: Add a comment
    Given a post exists
    And I am signed in and on the home page
    When I add the comment "cool post" to the post
    Then I should be on the home page
    And I should see "cool post" within the comments for the post