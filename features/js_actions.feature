@javascript
Feature: JS Actions
  As a user
  I want to be post something quickly using javascript
  So that I can see things update without a page reload

  Scenario: Add a post via javascript
    Given I am signed in and on the home page
    And the page is expected to not reload
    When I add the post "This is my js post"
    And I wait for the ajax to finish
    Then the page should not have been reloaded
    And I should see "This is my js post" within the post


  Scenario: Add a comment via javascript
    Given a post exists
    And I am signed in and on the home page
    And the page is expected to not reload
    When I add the comment "cool post" to the post
    And I wait for the ajax to finish
    Then the page should not have been reloaded
    And I should see "cool post" within the comments for the post
    And I should see "1 comment" within the post


  Scenario: Delete a comment via javascript
    Given a post exists
    And I am signed in and on the home page
    And the page is expected to not reload
    When I add the comment "cool post" to the post
    And I wait for the ajax to finish
    Then I should see "cool post" within the comments for the post
    And I should see "1 comment" within the post
    When I click "Delete" within the comment
    And I wait for the ajax to finish
    Then the page should not have been reloaded
    And I should not see "cool post" within the comments for the post
    And I should see "0 comments" within the post


  Scenario: Like a post via javascript
    Given a post exists
    And I am signed in and on the home page
    And the page is expected to not reload
    When I like the post
    And I wait for the ajax to finish
    Then the page should not have been reloaded
    And I should see "1 like" within the post
    And I should see "Unlike" within the post


  Scenario: Like and unlike a post via javascript
    Given a post exists
    And I am signed in and on the home page
    And the page is expected to not reload
    When I like the post
    And I wait for the ajax to finish
    Then the page should not have been reloaded
    And I should see "1 like" within the post
    And I should see "Unlike" within the post
    When I unlike the post
    And I wait for the ajax to finish
    Then the page should not have been reloaded
    And I should see "0 likes" within the post
    And I should see "Like" within the post
