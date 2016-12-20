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
  @element = @page.select_list_id_element
end

When(/^I search for the select list by "(.*?)"$/) do |how|
  @how = how
end

Then(/^option "(.*?)" should contain "(.*?)"$/) do |opt_num, text|
  @element = @page.send "select_list_#{@how}_element".to_sym
  expect(@element[opt_num.to_i - 1].text).to eql text
end

Then(/^each option should contain "(.*?)"$/) do |text|
  @element.options.each do |option|
    expect(option.text).to include text
  end
end

When(/^I search for the select list bys "(.*?)" and "(.*?)"$/) do |param1, param2|
  @how = "#{param1}_#{param2}"
end

When(/^I find a select list while the script is executing$/) do
  @select_list = @page.select_list_element(:id => "sel_list_id")
end

Then(/^I should be able to select "(.*?)" from the list$/) do |value|
  @select_list.select value
end

Then(/^I should see that the select list exists$/) do
  expect(@page.select_list_id?).to be true
end

Then(/^the selected option should be "([^"]*)"$/) do |text|
  expect(@page.select_list_element(:id => 'sel_list_id').selected_options[0]).to eql text
end

Then(/^the select list should include "([^"]*)"$/) do |text|
  expect(@page.select_list_id_element).to include text
end

Then(/^the select list should know that "([^"]*)" is selected$/) do |text|
  expect(@page.select_list_id_element.selected?(text)).to be true
end

Then(/^the value for the option should be "([^"]*)"$/) do |value|
  @element = @page.send "select_list_#{@how}_element".to_sym
  expect(@element.value).to eql value
end
