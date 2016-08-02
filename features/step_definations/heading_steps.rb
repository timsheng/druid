When(/^I get the text for the "([^"]*)" element$/) do |el|
  @heading = @page.send "#{el}_id"
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(@heading).to eql text
end

When(/^I search for the heading(\d+) by "([^"]*)"$/) do |head_type, type|
  @heading = @page.send "h#{head_type}_#{type}"
end

When(/^I locate the h(\d+) using "([^"]*)" and "([^"]*)"$/) do |head_type, param1, param2|
  @text = @page.send "h#{head_type}_#{param1}_#{param2}".to_sym
end

When(/^I locate a h1 while the script is executing$/) do
  @text = @page.h1_element(:id => 'h1_id').text
end

When(/^I locate a h2 while the script is executing$/) do
  @text = @page.h2_element(:id => 'h2_id').text
end

When(/^I locate a h3 while the script is executing$/) do
  @text = @page.h3_element(:id => 'h3_id').text
end

When(/^I locate a h4 while the script is executing$/) do
  @text = @page.h4_element(:id => 'h4_id').text
end

When(/^I locate a h5 while the script is executing$/) do
  @text = @page.h5_element(:id => 'h5_id').text
end

When(/^I locate a h6 while the script is executing$/) do
  @text = @page.h6_element(:id => 'h6_id').text
end
