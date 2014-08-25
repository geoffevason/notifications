Given /^I opt to get emails when "([^\"]+)"$/ do |notification_type|
  step %{I go to the notification preferences page}
  step %{I check "#{notification_type}"}
  step %{I press "Save"}
end

Given /^I opt not to get emails when "([^\"]+)"$/ do |notification_type|
  step %{I go to the notification preferences page}
  step %{I uncheck "#{notification_type}"}
  step %{I press "Save"}
end