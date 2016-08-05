Then(/^I should know its' text is "(.*?)"$/) do |text|
  expect(@element.text).to eql text
end

Then(/^I should know it is equal to itself$/) do
  expect(@element==@element).to be true
end

Then(/^I should know its' tag name is "(.*?)"$/) do |tagname|
  expect(@element.tag_name).to eql tagname
end

Then(/^I should know the attribute "(.*?)" is false$/) do |attr_name|
  @attr = @element.attribute(attr_name)
  # expect(@attr.is_a? NilClass).to be true
  expect(@attr).to be_nil
end

Then(/^I should be able to click it$/) do
  @element.click
end

Then(/^I should know its' value is "(.*?)"$/) do |value|
  expect(@element.value).to eql value
end

Then(/^I should know its' text includes "(.*?)"$/) do |text|
  expect(@element.text).to include text
end

Then(/^I should know it is not visible$/) do
  expect(@element).not_to be_visible
end

When(/^I clear the text field$/) do
  @page.text_field_id_element.clear
end

When(/^I retrieve a heading element$/) do
  @element = @page.h1_id_element
end

When(/^I click an enabled button$/) do
  @element = @page.button_id_element
end

Then(/^it should know it is enabled$/) do
  expect(@element.enabled?).to be true
end

When(/^I check a disabled button$/) do
  @element = @page.disabled_button_element
end

Then(/^it should know it is not enabled$/) do
  expect(@element.enabled?).not_to be true
end

When(/^I set the focus to the test text_field using the onfocus event$/) do
  @page.text_field_element(:id => 'onfocus_text_field').fire_event('onfocus')
end

Then(/^I should see the onfocus text "([^"]*)"$/) do |text|
  expect(@page.div_element(:id => 'onfocus_test').text).to eql text
end
