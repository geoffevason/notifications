Given(/^the page is expected to not reload$/) do
  page.evaluate_script "window.notReloaded = true"
end

Then(/^the page should not have been reloaded$/) do
  result = page.evaluate_script("window.notReloaded")
  expect(result).to eq(true)
end

When(/^I wait for the ajax to finish$/) do
  wait_for_ajax
end