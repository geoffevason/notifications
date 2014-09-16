Feature: Notification Emails
  As a user
  I want to choose if I want to receive email notifications based on stuff that is related to me
  So that I can be more engaged with the app and not feel like I'm being spammed

  Scenario: Notification preferences should appear checked
    Given I am signed in
    And I opt to get emails when "someone comments on my post"
    When I go to the notification preferences page
    Then the "someone comments on my post" checkbox should be checked

  Scenario: Original poster receives an email notification when a comment is made
    Given I am signed in
    And I opt to get emails when "someone comments on my post"    
    And I have created a post
    When another user "Alice" comments on the post
    Then I should receive an email with subject "Alice commented on your post"


  Scenario: Original poster does NOT receive an email notification when a comment is made
    Given I am signed in
    And I opt not to get emails when "someone comments on my post"
    And I have created a post
    When another user "Bob" comments on the post
    Then I should receive no email


  Scenario: Original poster receives an email notification when someone likes their post
    Given I am signed in
    And I opt to get emails when "someone likes my post"
    And I have created a post
    When another user "Carol" likes the post
    Then I should receive an email with subject "Carol liked your post"


  Scenario: Original poster receives an email notification when someone likes their comment
    Given I am signed in
    And I opt to get emails when "someone likes my comment"
    And I have commented on a post
    When another user "Doug" likes the comment
    Then I should receive an email with subject "Doug liked your comment"


  Scenario: Original poster receives an email notification when someone comments on a post they've commented on
    Given I am signed in
    And I opt to get emails when "someone comments on a post I've commented on"
    And a user "Emily" exists
    And the user "Emily" has created a post
    And I have commented on the post
    When another user "Fred" comments on the post
    Then I should receive an email with subject "Fred also commented on Emily's post"
