class MultiElementsPage
  include Druid

  divs(:the_divs, :class => 'div')
  buttons(:the_buttons, :class => 'button')
  text_fields(:the_text_fields, :class => 'textfield')
  hidden_fields(:the_hidden_fields, :class => 'hiddenfield')
  text_areas(:the_text_areas, :class => 'textarea')
  select_lists(:the_select_lists, :class => 'selectlist')
  links(:the_links, :class => 'link')
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

When(/^I select the forms with class "([^"]*)"$/) do |class_name|
  @elements = @page.form_elements(:class => class_name)
end

Then(/^I should have (\d+) forms$/) do |num_forms|
  expect(@elements.size).to eql num_forms.to_i
end

Then(/^the action for form (\d+) should be "([^"]*)"$/) do |form_num, action|
  expect(@elements[form_num.to_i - 1].attribute(:action)).to match action
end

When(/^I select the list items with class "([^"]*)"$/) do |class_name|
  @elements = @page.list_item_elements(:class => class_name)
end

Then(/^I should have (\d+) list items$/) do |num_list_items|
  expect(@elements.size).to eql num_list_items.to_i
end

Then(/^the text for list item (\d+) should be "([^"]*)"$/) do |list_item_num, text|
  expect(@elements[list_item_num.to_i - 1].text).to eql text
end

When(/^I select the unordered lists with class "([^"]*)"$/) do |class_name|
  @elements = @page.unordered_list_elements(:class => class_name)
end

Then(/^I should have (\d+) unordered lists$/) do |num_unordered_list|
  expect(@elements.size).to eql num_unordered_list.to_i
end

Then(/^the text for the first item in unordered list (\d+) should be "([^"]*)"$/) do |ul_num, text|
  expect(@elements[ul_num.to_i - 1][0].text).to eql text
end

When(/^I select the ordered lists with class "([^"]*)"$/) do |class_name|
  @elements = @page.ordered_list_elements(:class => class_name)
end

Then(/^I should have (\d+) ordered lists$/) do |num_ol|
  expect(@elements.size).to eql num_ol.to_i
end

Then(/^the text for the first item in ordered list (\d+) should be "([^"]*)"$/) do |ol_num, text|
  expect(@elements[ol_num.to_i - 1][0].text).to eql text
end

When(/^I select the h1s with class "([^"]*)"$/) do |class_name|
  @elements = @page.h1_elements(:class => class_name)
end

Then(/^I should have (\d+) h1s$/) do |num_h1s|
  expect(@elements.size).to eql num_h1s.to_i
end

Then(/^the text for h1 (\d+) should be "([^"]*)"$/) do |h1_num, text|
  expect(@elements[h1_num.to_i - 1].text).to eql text
end

When(/^I select the h2s with class "([^"]*)"$/) do |class_name|
  @elements = @page.h2_elements(:class => class_name)
end

Then(/^I should have (\d+) h2s$/) do |num_h2s|
  expect(@elements.size).to eql num_h2s.to_i
end

Then(/^the text for h2 (\d+) should be "([^"]*)"$/) do |h2_num, text|
  expect(@elements[h2_num.to_i - 1].text).to eql text
end

When(/^I select the h3s with class "([^"]*)"$/) do |class_name|
  @elements = @page.h3_elements(:class => class_name)
end

Then(/^I should have (\d+) h3s$/) do |num_h3s|
  expect(@elements.size).to eql num_h3s.to_i
end

Then(/^the text for h3 (\d+) should be "([^"]*)"$/) do |h3_num, text|
  expect(@elements[h3_num.to_i - 1].text).to eql text
end

When(/^I select the h4s with class "([^"]*)"$/) do |class_name|
  @elements = @page.h4_elements(:class => class_name)
end

Then(/^I should have (\d+) h4s$/) do |num_h4s|
  expect(@elements.size).to eql num_h4s.to_i
end

Then(/^the text for h4 (\d+) should be "([^"]*)"$/) do |h4_num, text|
  expect(@elements[h4_num.to_i - 1].text).to eql text
end

When(/^I select the h5s with class "([^"]*)"$/) do |class_name|
  @elements = @page.h5_elements(:class => class_name)
end

Then(/^I should have (\d+) h5s$/) do |num_h5s|
  expect(@elements.size).to eql num_h5s.to_i
end

Then(/^the text for h5 (\d+) should be "([^"]*)"$/) do |h5_num, text|
  expect(@elements[h5_num.to_i - 1].text).to eql text
end

When(/^I select the h6s with class "([^"]*)"$/) do |class_name|
  @elements = @page.h6_elements(:class => class_name)
end

Then(/^I should have (\d+) h6s$/) do |num_h6s|
  expect(@elements.size).to eql num_h6s.to_i
end

Then(/^the text for h6 (\d+) should be "([^"]*)"$/) do |h6_num, text|
  expect(@elements[h6_num.to_i - 1].text).to eql text
end

When(/^I select the paragraphs with class "([^"]*)"$/) do |class_name|
  @elements = @page.paragraph_elements(:class => class_name)
end

Then(/^I should have (\d+) paragraphs$/) do |num_paragraphs|
  expect(@elements.size).to eql num_paragraphs.to_i
end

Then(/^the text for paragraph (\d+) should be "([^"]*)"$/) do |paragraph_num, text|
  expect(@elements[paragraph_num.to_i - 1].text).to eql text
end

When(/^I select the labels with class "([^"]*)"$/) do |class_name|
  @elements = @page.label_elements(:class => class_name)
end

Then(/^I should have (\d+) labels$/) do |num_labels|
  expect(@elements.size).to eql num_labels.to_i
end

Then(/^the text for label (\d+) should be "([^"]*)"$/) do |label_num, text|
  expect(@elements[label_num.to_i - 1].text).to eql text
end

When(/^I select all buttons using no identifier$/) do
  @elements = @page.button_elements
end

When(/^I select all text fields using no identifier$/) do
  @elements = @page.text_field_elements
end

When(/^I select all hidden fields using no identifier$/) do
  @elements = @page.hidden_field_elements
end

When(/^I select all text areas using no identifier$/) do
  @elements = @page.text_area_elements
end

When(/^I select all select lists using no identifier$/) do
  @elements = @page.select_list_elements
end

When(/^I select all links using no identifier$/) do
  @elements = @page.link_elements
end

When(/^I select all checkboxes using no identifier$/) do
  @elements = @page.checkboxes_elements
end

When(/^I select all radio buttons using no identifier$/) do
  @elements = @page.radio_button_elements
end

When(/^I select all divs using no identifier$/) do
  @elements = @page.div_elements
end

When(/^I select all spans using no identifier$/) do
  @elements = @page.span_elements
end

When(/^I select all tables using no identifier$/) do
  @elements = @page.table_elements
end

When(/^I select all cells using no identifier$/) do
  @elements = @page.cell_elements
end

When(/^I select the images using no identifier$/) do
  @elements = @page.image_elements
end

When(/^I select the forms using no identifier$/) do
  @elements = @page.form_elements
end

When(/^I select all list items using no identifier$/) do
  @elements = @page.list_item_elements
end

When(/^I select all unordered lists using no identifier$/) do
  @elements = @page.unordered_list_elements
end

When(/^I select all ordered lists using no identifier$/) do
  @elements = @page.ordered_list_elements
end

When /^I select all h(\d+)s using no identifier$/ do |num|
  @elements = @page.send "h#{num}_elements"
end

When(/^I select all paragraphs using no identifier$/) do
  @elements = @page.paragraph_elements
end

When(/^I select all labels using no identifier$/) do
  @elements = @page.label_elements
end

When(/^I select the file fields with class "([^"]*)"$/) do |class_name|
  @elements = @page.file_field_elements(:class => class_name)
end

Then(/^I should have (\d+) file fields$/) do |num_file_fields|
  expect(@elements.size).to eql num_file_fields.to_i
end

Then(/^the title for file field (\d+) should be "([^"]*)"$/) do |file_field_num, title|
  expect(@elements[file_field_num.to_i - 1].attribute('title')).to eql title
end

When(/^I select all file fields using no identifier$/) do
  @elements = @page.file_field_elements
end

When(/^I select the divs using the generated method$/) do
  @elements = @page.the_divs_elements
end

When(/^I select the buttons using the generated method$/) do
  @elements = @page.the_buttons_elements
end

When(/^I select the text field using the generated method$/) do
  @elements = @page.the_text_fields_elements
end

When(/^I select the hidden fields using the generated method$/) do
  @elements = @page.the_hidden_fields_elements
end

When(/^I select the text areas using the generated method$/) do
  @elements = @page.the_text_areas_elements
end

When(/^I select the select lists using the generated method$/) do
  @elements = @page.the_select_lists_elements
end

When(/^I select the links using the generated method$/) do
  @elements = @page.the_links_elements
end
