When(/^I get the text for the "([^"]*)" element$/) do |el|
  @heading = @page.send "#{el}_id"
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(@heading).to eql text
end

When(/^I search for the heading1 by "([^"]*)"$/) do |type|
  @heading = @page.send "h1_#{type}"
end

When(/^I locate the h1 using "([^"]*)" and "([^"]*)"$/) do |param1, param2|
  @text = @page.send "h1_#{param1}_#{param2}".to_sym
end

When(/^I locate a h1 while the script is executing$/) do
  @text = @page.h1_element(:id => 'h1_id').text
end
