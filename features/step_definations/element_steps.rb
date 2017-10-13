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
  expect(@element.visible?).to be false
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

When(/^I set the focus on the test text_field$/) do
  @page.text_field_element(:id => 'text_field_id').click
  #  Focuses element. Note that Firefox queues focus events until the window actually has focus.
  @page.text_field_element(:id => 'onfocus_text_field').focus
end

When(/^I find the child link element$/) do
  @element = @page.child_element
end

When(/^ask for the parent element$/) do
  @parent = @element.parent
end

Then(/^I should have a div parent$/) do
  expect(@parent).to be_instance_of Druid::Elements::Div
end

Then(/^it should know that it is not disabled$/) do
  expect(@element).not_to be_disabled
end

Then(/^it should know that it is disabled$/) do
  expect(@element).to be_disabled
end

When(/^I set the focus to the test text_field$/) do
  @page.text_field_element(:id => 'onfocus_text_field').focus
end

Then(/^I should know that the text_field has the focus$/) do
  element = @page.element_with_focus
  expect(element).not_to be nil
  expect(element.class).to be Druid::Elements::TextField
end

When(/^I retrieve the label element$/) do
  @element = @page.label_id_element
end

Then(/^I should be able to flash it$/) do
  @element.flash
end

class HoverPage
  include Druid

  link(:hello)
end

Given(/^I am on the hover page$/) do
  @page = HoverPage.new(@driver)
  @page.navigate_to UrlHelper.hover
end

When(/^I hover over the hello link$/) do
  @page.hello_element.hover
end

Then(/^the font size should be "([^"]*)"$/) do |font_size|
  expect(@page.hello_element.style('font-size')).to eql font_size
end

Then(/^I should know its id is "([^"]*)"$/) do |id|
  expect(@element.id).to eql id
end

Then(/^I should know the html is "(.*)"$/) do |html|
  expect(@element.html).to eql html
end

Then(/^the heading element should be visible$/) do
  expect(@element.visible?).to be true
end

When(/^I retrieve a div using data\-entity$/) do
  @element = @page.div_data_entity_element
end

Then(/^I should know the text is "([^"]*)"$/) do |text|
  expect(@element.text).to eql text
end

When(/^I retrieve the figure uisng the declaration$/) do
  @element = @page.figure_id_element
end

Then(/^I should see the figure contains an image$/) do
  expect(@element.image_element).not_to be nil
end

When(/^I retrieve the figure using the element$/) do
  @element = @page.figure_element(:id => 'figure_id')
end

Then(/^I should know the attribute "([^"]*)" includes "([^"]*)"$/) do |attribute, included|
  @attr = @element.attribute(attribute)
  expect(@attr).to include included
end

Then(/^I should know the paragraph class is "([^"]*)"$/) do |class_name|
  expect(@page.p_id_element.class_name).to eql class_name
end

Then(/^I should be able to select "([^"]*)" from the paragraph$/) do |text|
  @page.p_id_element.select_text text
end

Then(/^I should be able to know its location$/) do
  expect(@element.location.y).to be > 0
  expect(@element.location.x).to be > 0
end

Then(/^I should be able to know its size$/) do
  expect(@element.size.width).to be > 0
  expect(@element.size.height).to be > 0
end

Then(/^the element width is not 0$/) do
  expect(@element.width.is_a? Integer).to be true
  expect(@element.width).to be > 0
end

Then(/^the element height is not 0$/) do
  expect(@element.height.is_a? Integer).to be true
  expect(@element.height).to be > 0
end

Then(/^the element centre should be greater than element y position$/) do
  expect(@element.centre['y']).to be > @element.location.y
end

Then(/^the element centre should be greater than element x position$/) do
  expect(@element.centre['x']).to be > @element.location.x
end

When(/^I retrieve the focus state of the text_field$/) do
  @focused_state = @page.text_field_onfocus_element.focused?
end

Then(/^I should know that the text_field is focused$/) do
  expect(@focused_state).to be true
end

Given(/^I set the focus off the test text_field$/) do
  @page.text_field_unfocus_element.focus
end

Then(/^I should know that the text_field is not focused$/) do
  expect(@focused_state).to be false
end
