When(/^I set the file field to the step definition file$/) do
  @page.file_field_id = __FILE__
end

Then(/^This filefield element should exist$/) do
  expect(@page.file_field_id_element.exist?).to be true
end
