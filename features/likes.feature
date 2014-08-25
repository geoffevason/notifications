Feature: Like things
  As a user
  I want to be able to like things
  Because I'm just that kind of person


  Scenario: Like a post
    Given I am signed in
    And a post exists
    When I go to the home page
    Then I should see "Like" within the post
    When I click "Like" within the post
    Then I should see "Unlike" within the post
    And the post should have 1 like


  Scenario: Like a comment
    Given I am signed in
    And a post exists
    And the post has a comment
    When I go to the home page
    Then I should see "Like" within the comment
    When I click "Like" within the comment
    Then I should see "Unlike" within the comment
    And the comment should have 1 like


  Scenario: Like count on post
    Given a post exists
    And the post has 2 likes
    And I am signed in
    When I go to the home page
    Then I should see "2 likes" within the post

  Scenario: Like count on comment
    Given a post exists
    And the post has a comment
    And the comment has 3 likes
    And I am signed in
    When I go to the home page
    Then I should see "3 likes" within the comment


  Scenario: Unlike a post
    Given I am signed in
    And a post exists
    And I have liked the post
    When I go to the home page
    Then I should see "Unlike" within the post
    When I click "Unlike" within the post
    Then I should see "Like" within the post
    And the post should have 0 likes


  Scenario: Like a comment
    Given I am signed in
    And a post exists
    And the post has a comment
    And I have liked the comment
    When I go to the home page
    Then I should see "Unlike" within the comment
    When I click "Unlike" within the comment
    Then I should see "Like" within the comment
    And the comment should have 0 likes