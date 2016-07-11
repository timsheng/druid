When(/^I retrieve the hidden field element$/) do
  @element = @page.hidden_field_id_element
end

Then(/^I should see the hidden field contains "(.*?)"$/) do |text|
  expect(@page.hidden_field_id).to eql text
end

When(/^I locate the hidden field by "(.*?)"$/) do |how|
  @element = @page.send "hidden_field_#{how}_element".to_sym
end

Then(/^hidden field element should contains "(.*?)"$/) do |text|
  expect(@element.value).to eql text
end

When(/^I search for the hidden field by "(.*?)" and "(.*?)"$/) do |param1, param2|
  @element = @page.send "hidden_field_#{param1}_#{param2}_element".to_sym
end

When(/^I find a hidden field while the script is executing$/) do
  @element = @page.hidden_field_element(:id => "hidden_field_id")
end
