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


  Scenario: Comments Count
    Given a post exists
    And the post has 2 comments
    And I am signed in
    When I go to the home page
    And I add the comment "cool post" to the post
    Then I should be on the home page
    And I should see "3 comments" within the comments for the post