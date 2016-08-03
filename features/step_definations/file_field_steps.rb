When(/^I set the file field to the step definition file$/) do
  @page.file_field_id = __FILE__
end

Then(/^This filefield element should exist$/) do
  expect(@page.file_field_id_element.exist?).to be true
end

When(/^I search for the file field by "([^"]*)"$/) do |how|
  @how = how
end

Then(/^I should be able to set the file field$/) do
  @page.send "file_field_#{@how}=", __FILE__
end

When(/^I search for the file field by "([^"]*)" and "([^"]*)"$/) do |param1, param2|
  @how = "#{param1}_#{param2}"
end
