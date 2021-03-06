When(/^I get the first item from the unordered list$/) do
  @element = @page.ul_id_element[0]
end

When(/^I locate the unordered list by "(.*?)"$/) do |how|
  @list = @page.send "ul_#{how}_element".to_sym
end

When(/^I search for the unordered list by "(.*?)" and "(.*?)"$/) do |param1, param2|
  @list = @page.send "ul_#{param1}_#{param2}_element".to_sym
end

When(/^I retrieve a unordered list element$/) do
  @element = @page.ul_id_element
end

When(/^I search for the unordered list while the script is executing$/) do
  @list = @page.unordered_list_element(:id => 'ul_id')
end

Then(/^I should see that the unordered list exists$/) do
  expect(@page.ul_id?).to be true
end

Then(/^the text for the unordered list should contain "([^"]*)"$/) do |text|
  expect(@page.send("ul_id")).to include text
end
