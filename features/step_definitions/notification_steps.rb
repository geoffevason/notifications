Then(/^I should see (\d+) unread notifications?$/) do |expected_count|
  expect(page).to have_css("#notifications .notification.unread", count: expected_count.to_i)
end