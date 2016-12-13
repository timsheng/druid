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

When(/^I select the hidden fields with class "([^"]*)"$/) do |class_name|
  @elements = @page.hidden_field_elements(:class => class_name)
end

Then(/^I should have (\d+) hidden fields$/) do |num_hidden_fields|
  expect(@elements.size).to eql num_hidden_fields.to_i
end

Then(/^the value of hidden field (\d+) should be "([^"]*)"$/) do |hidden_field_num, value|
  expect(@elements[hidden_field_num.to_i - 1].value).to eql value
end

When(/^I select the text areas with class "([^"]*)"$/) do |class_name|
  @elements = @page.text_area_elements(:class => class_name)
end

Then(/^I should have (\d+) text areas$/) do |num_text_areas|
  expect(@elements.size).to eql num_text_areas.to_i
end

Then(/^the value of text area (\d+) should be "([^"]*)"$/) do |text_area_num, value|
  expect(@elements[text_area_num.to_i - 1].value).to eql value
end

When(/^I select the select lists with class "([^"]*)"$/) do |class_name|
  @elements = @page.select_list_elements(:class => class_name)
end

Then(/^I should have (\d+) select lists$/) do |num_select_lists|
  expect(@elements.size).to eql num_select_lists.to_i
end

Then(/^the value of select list (\d+) should be "([^"]*)"$/) do |select_list_num, value|
  expect(@elements[select_list_num.to_i - 1].value).to eql value
end

When(/^I select the link with class "([^"]*)"$/) do |class_name|
  @elements = @page.link_elements(:class => class_name)
end

Then(/^I should have (\d+) links$/) do |num_links|
  expect(@elements.size).to eql num_links.to_i
end

Then(/^the text of link (\d+) should be "([^"]*)"$/) do |link_num, text|
  expect(@elements[link_num.to_i - 1].text).to eql text
end

When(/^I select the check boxes with class "([^"]*)"$/) do |class_name|
  @elements = @page.checkbox_elements(:class => class_name)
end

Then(/^I should have (\d+) checkboxes$/) do |num_checkboxes|
  expect(@elements.size).to eql num_checkboxes.to_i
end

Then(/^the value of checkbox (\d+) should be "([^"]*)"$/) do |checkbox_num, value|
  expect(@elements[checkbox_num.to_i - 1].value).to eql value
end

When(/^I select the radio buttons with class "([^"]*)"$/) do |class_name|
  @elements = @page.radio_button_elements(:class => class_name)
end

Then(/^I should have (\d+) radio buttons$/) do |num_radio_buttons|
  expect(@elements.size).to eql num_radio_buttons.to_i
end

Then(/^the value of radio button (\d+) should be "([^"]*)"$/) do |radio_button_num, value|
  expect(@elements[radio_button_num.to_i - 1].value).to eql value
end

When(/^I select the divs with class "([^"]*)"$/) do |class_name|
  @elements = @page.div_elements(:class => class_name)
end

Then(/^I should have (\d+) divs$/) do |num_divs|
  expect(@elements.size).to eql num_divs.to_i
end

Then(/^the text of div (\d+) should be "([^"]*)"$/) do |div_num, text|
  expect(@elements[div_num.to_i - 1].text).to eql text
end

When(/^I select the spans with class "([^"]*)"$/) do |class_name|
  @elements = @page.span_elements(:class => class_name)
end

Then(/^I should have (\d+) spans$/) do |num_spans|
  expect(@elements.size).to eql num_spans.to_i
end

Then(/^the text of span (\d+) should be "([^"]*)"$/) do |span_num, text|
  expect(@elements[span_num.to_i - 1].text).to eql text
end

When(/^I select the tables with class "([^"]*)"$/) do |class_name|
  @elements = @page.table_elements(:class => class_name)
end

Then(/^I should have (\d+) tables$/) do |num_tables|
  expect(@elements.size).to eql num_tables.to_i
end

Then(/^the first row first column for table (\d+) should have "([^"]*)"$/) do |table_num, text|
  expect(@elements[table_num.to_i - 1][0][0].text).to eql text
end

When(/^I select the cells with class "([^"]*)"$/) do |class_name|
  @elements = @page.cell_elements(:class => class_name)
end

Then(/^I should have (\d+) cells$/) do |num_cells|
  expect(@elements.size).to eql num_cells.to_i
end

Then(/^the text for cell (\d+) should be "([^"]*)"$/) do |cell_num, text|
  expect(@elements[cell_num.to_i - 1].text).to eql text
end

When(/^I select the images with class "([^"]*)"$/) do |class_name|
  @elements = @page.image_elements(:class => class_name)
end

Then(/^I should have (\d+) images$/) do |num_images|
  expect(@elements.size).to eql num_images.to_i
end

Then(/^the alt for image (\d+) should be "([^"]*)"$/) do |image_num , alt|
  expect(@elements[image_num.to_i - 1].attribute(:alt)).to eql alt
end
