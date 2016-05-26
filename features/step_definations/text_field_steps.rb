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
  @element = @page.text_field_id_text_field
end
