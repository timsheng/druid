When(/^I get the italic text for the "([^"]*)" element$/) do |el|
  @i = @page.send "#{el}_id"
end

Then(/^I should see "([^"]*)" in italic$/) do |text|
  expect(@i).to eq text
end

When(/^I search italic text for the i by "([^"]*)"$/) do |how|
  @i = @page.send "i_#{how}"
end
