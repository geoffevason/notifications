Feature: Like things
  As a user
  I want to be able to like things
  Because I'm just that kind of person


  Scenario: Like a post
    Given I am signed in
    And a post exists
    And I am on the home page
    Then I should see "Like" within the post
    When I click "Like" within the post
    Then I should see "Unlike" within the post


  Scenario: Like a comment
    Given I am signed in
    And a post exists
    And the post has a comment
    And I am on the home page
    Then I should see "Like" within the comment
    When I click "Like" within the comment
    Then I should see "Unlike" within the comment
