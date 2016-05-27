When(/^I select "(.*?)" from the select list$/) do |item|
  @page.select_list_id = item
end

Then(/^the current item should be "(.*?)"$/) do |expected_item|
  expect(@page.select_list_id).to eql expected_item
end

When(/^I locate the select list by "(.*?)"$/) do |how|
  @how = how
end

Then(/^I should be able to select "(.*?)"$/) do |item|
  @page.send "select_list_#{@how}=".to_sym, item
end

Then(/^the value for the selected item should be "(.*?)"$/) do |expected_item|
  expect(@page.send "select_list_#{@how}".to_sym).to eql expected_item
end

When(/^I retrieve a select list$/) do
  @element = @page.select_list_id_select_list
end
