When(/^I type "(.*?)" into the text field$/) do |text|
  @page.text_field_id = text
end

Then(/^the text field should contain "(.*?)"$/) do |expected_text|
  expect(@page.text_field_id).to include expected_text
end

When(/^I locate the text field by "(.*?)"$/) do |how|
  @how = how
end

Then(/^I should be able to type "(.*?)" into the field$/) do |value|
  @page.send "text_field_#{@how}=".to_sym, value
end

When(/^I retrieve a text field$/) do
  @element = @page.text_field_id_element
end

When(/^I search for the text field by "(.*?)" and "(.*?)"$/) do |param1, param2|
  @how = "#{param1}_#{param2}"
end

When(/^I find a text field while the script is executing$/) do
  @text_field = @page.text_field_element(:id => 'text_field_id')
end

Then(/^I should be able to type "(.*?)" into the field element$/) do |value|
  @text_field.value = value
end

Then(/^I should see that the text field exists$/) do
  expect(@page.text_field_id?).to be true
end

When(/^I append "([^"]*)" to the text field$/) do |text|
  @page.text_field_id_element.append text
end
