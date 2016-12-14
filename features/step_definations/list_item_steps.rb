When(/^I get the text from the list item$/) do
  @text = @page.li_id
end

When(/^I locate the list item by "(.*?)"$/) do |how|
  @element = @page.send "li_#{how}_element".to_sym
  @text = @element.text
end

When(/^I search for the list item by "(.*?)" and "(.*?)"$/) do |param1, param2|
  @text = @page.send "li_#{param1}_#{param2}"
end

When(/^I retrieve a list item element$/) do
  @element = @page.li_id_element
end

When(/^I search for the list item while the script is executing$/) do
  @text = @page.list_item_element(:id => 'li_id').text
end

Then(/^I should see that the list item exists$/) do
  expect(@page.li_id?).to be true
end
