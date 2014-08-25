Feature: Notifications
  As a user
  I want to receive notifications based on stuff that is related to me
  So that I can be more engaged with the app

  Scenario: Original poster receives a notification when a comment is made on their post
    Given a user "poster" exists
    And the user "poster" has created a post
    And a user "commenter" exists with the name "Alice"
    
    When I sign in as user "commenter"
    And I comment on the post

    And I sign in as user "poster"
    And I go to the home page    
    Then I should see 1 unread notification
    And I should see "Alice commented on your post" within the notifications area
    
    
  Scenario: Commenter receives a notification when another comment is made
    Given a user "poster" exists with the name "Bob"
    And the user "poster" has created a post
    And a user "original_commenter" exists
    And the user "original_commenter" has commented on the post
    And a user "another_commenter" exists with the name "Carol"
    
    When I sign in as user "another_commenter"
    And I comment on the post

    And I sign in as user "original_commenter"
    And I go to the home page
    Then I should see 1 unread notification
    And I should see "Carol also commented on Bob's post" within the notifications area
    
    
  Scenario: Original poster receives a notification when their post is liked
    Given a user "poster" exists with the name "Bob"
    And the user "poster" has created a post
    And a user "liker" exists with the name "Doug"
    
    When I sign in as user "liker"
    And I like the post

    And I sign in as user "poster"
    And I go to the home page
    Then I should see 1 unread notification
    And I should see "Doug liked your post" within the notifications area


  Scenario: Original commenter receives a notification when their comment is liked
    Given a post exists
    And a user "commenter" exists
    And the user "commenter" has commented on the post
    And a user "liker" exists with the name "Emily"
    
    When I sign in as user "liker"
    And I like the comment

    And I sign in as user "commenter"
    And I go to the home page
    Then I should see 1 unread notification
    And I should see "Emily liked your comment" within the notifications area
    

 Scenario: Original poster no longer sees a notification when a comment is deleted
   Given a user "poster" exists
   And the user "poster" has created a post
   And a user "commenter" exists
   And the user "commenter" has commented on the post
   
   When I sign in as user "poster"
   Then I should see 1 unread notification
   
   When I sign in as user "commenter"
   And I delete the comment
   
   And I sign in as user "poster"
   Then I should see 0 unread notifications
   
 
 
 Scenario: Original poster no longer sees a notification when a like is deleted
   Given a user "poster" exists
   And the user "poster" has created a post
   And a user "liker" exists
 
   When I sign in as user "liker"
   And I like the post
   
   And I sign in as user "poster"
   Then I should see 1 unread notification
   
   When I sign in as user "liker"
   And I unlike the post
   
   And I sign in as user "poster"
   Then I should see 0 unread notifications

