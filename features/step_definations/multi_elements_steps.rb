class MultiElementsPage
  include Druid
end

Given(/^I am on the multi elements page$/) do
  @page = MultiElementsPage.new(@driver)
  @page.navigate_to(UrlHelper.multi)
end

When(/^I select the buttons with class "([^"]*)"$/) do |class_name|
  @elements = @page.button_elements(:class => class_name)
end

Then(/^I should have (\d+) buttons$/) do |num_buttons|
  expect(@elements.size).to eql num_buttons.to_i
end

Then(/^the value of button (\d+) should be "([^"]*)"$/) do |button_num, value|
  expect(@elements[button_num.to_i - 1].value).to eql value
end

When(/^I select the text fields with class "([^"]*)"$/) do |class_name|
  @elements = @page.text_field_elements(:class => class_name)
end

Then(/^I should have (\d+) text fields$/) do |num_text_fields|
  expect(@elements.size).to eql num_text_fields.to_i
end

Then(/^the value of text field (\d+) should be "([^"]*)"$/) do |text_field_num, value|
  expect(@elements[text_field_num.to_i - 1].value).to eql value
end
