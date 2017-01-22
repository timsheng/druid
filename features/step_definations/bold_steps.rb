When(/^I get the bold text for the "([^"]*)" element$/) do |el|
  @b = @page.send "#{el}_id"
end

Then(/^I should see "([^"]*)" in bold$/) do |text|
  expect(@b).to eql text
end

When(/^I search bold text for the b by "([^"]*)"$/) do |type|
  @b = @page.send "b_#{type}"
end
