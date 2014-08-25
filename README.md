Notifications
=============

This application is a demo app for a simple public news feed.  It includes the following features:

The Feed:
- Users can add posts to a public feed
- Users can comment on posts
  - (can later delete their comments)
- Users can like posts or comments (the Like model uses a polymorphic association)
  - (can later unlike something)


Notifications:
- Users will get notified via on site notifications when another user takes an action related to something they've done
  - eg likes or comments on their post
- Users can optionally receive email notifications as


Responsive Design:
- Uses ZURB foundation 5 for responsive design



Points of Interest
------------------

- Ruby 2.1.2
- Rails 4.1.5
- rspec for unit testing
- Cucumber for integration testing
- HAML
- Devise for authentication


Model Concerns: There are 2 concerns. The first is for items that are likeable.  The second is for items that cause
the creation of notifications (NotificationSource).

ActionJob:  The notification objects and emails are created via a NotificationsCreationJob object.  When Rails 4.2 is
available this will be updated to inherit from AcitonJob so it can be run asynchronously.

