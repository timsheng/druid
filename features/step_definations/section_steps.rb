class Container
  include Druid

  link(:section_link)
  button(:section_button)
  text_field(:section_text_field)
  hidden_field(:section_hidden_field)
  text_area(:section_text_area)
  select_list(:section_select_list)
  file_field(:section_file_field)
  checkbox(:section_checkbox)
  radio_button(:section_radio_button)
  div(:section_div)
  span(:section_span)
  table(:section_table)
  cell(:section_cell) { |page| page.section_table_element.cell_element(:index => 1) }
  image(:section_image)
  form(:section_form)
  ordered_list(:section_ordered_list)
  unordered_list(:section_unordered_list)
  list_item(:section_list_item) { |page| page.section_ordered_list_element.list_item_element }
  h1(:section_h1)
  h2(:section_h2)
  h3(:section_h3)
  h4(:section_h4)
  h5(:section_h5)
  h6(:section_h6)
  paragraph(:section_paragraph)

  unordered_list(:outside_section, :id => 'outer')
end

class InputSection
  include Druid

  def value
    root.value
  end
end

class SectionElementsPage
  include Druid

  page_section(:container, Container, :id => 'div_id')
  page_sections(:page_inputs, InputSection, :tag_name => 'input')

end
Given(/^I am on the section elements page$/) do
  @page = SectionElementsPage.new(@driver)
  @page.navigate_to(UrlHelper.nested_elements)
end

When(/^I get the text from the section$/) do
  @text = @page.container.text
end

Then(/^the text should include "([^"]*)"$/) do |expected_text|
  expect(@text).to include expected_text
end

When(/^I access an element that is outside of the section$/) do
  @element = @page.container.outside_section_element
end

Then(/^I should see that is doesn't exist in the section$/) do
  expect(@element).not_to exist
end

When(/^I search for a link located in a section$/) do
  @link = @page.container.section_link_element
end

Then(/^I should be able to click the section link$/) do
  @link.click
end

When(/^I search for a button located in a section$/) do
  @button = @page.container.section_button_element
end

Then(/^I should be able to click the section button$/) do
  @button.click
end

When(/^I search for a text field located in a section$/) do
  @text_field = @page.container.section_text_field_element
end

Then(/^I should be able to type "([^"]*)" in the section text field$/) do |value|
  @text_field.value = value
end

When(/^I search for a hidden field located in a section$/) do
  @hidden_field = @page.container.section_hidden_field_element
end

Then(/^I should be able to see that the section hidden field contains "([^"]*)"$/) do |value|
  expect(@hidden_field.value).to eql value
end

When(/^I search for a text area located in a section$/) do
  @text_area = @page.container.section_text_area_element
end

Then(/^I should be able to type "([^"]*)" in the section text area$/) do |value|
  @text_area.value = value
end

When(/^I search for a select list located in a section$/) do
  @select_list = @page.container.section_select_list_element
end

Then(/^I should be able to select "([^"]*)" in the section select list$/) do |value|
  @select_list.select value
end

When(/^I search for a file field located in a section$/) do
  @ff = @page.container.section_file_field_element
end

Then(/^I should be able to set the section file field$/) do
  @ff.value = __FILE__
end

When(/^I search for a checkbox located in a section$/) do
  @checkbox = @page.container.section_checkbox_element
end

Then(/^I should be able to check the section checkbox$/) do
  @checkbox.check
end

When(/^I search for a radio button located in a section$/) do
  @radio = @page.container.section_radio_button_element
end

Then(/^I should be able to select the section radio button$/) do
  @radio.select
end

When(/^I search for a div located in a section$/) do
  @div = @page.container.section_div_element
end

Then(/^I should see the text "([^"]*)" in the section div$/) do |value|
  expect(@div.text).to eql value
end

When(/^I search for a span located in a section$/) do
  @span = @page.container.section_span_element
end

Then(/^I should see the text "([^"]*)" in the section span$/) do |value|
  expect(@span.text).to eql value
end

When(/^I search for a table located in a section$/) do
  @table = @page.container.section_table_element
end

Then(/^the data for row "([^"]*)" of the section table should be "([^"]*)" and "([^"]*)"$/) do |row, col1, col2|
  table_row = @table[row.to_i - 1]
  expect(table_row[0].text).to eql col1
  expect(table_row[1].text).to eql col2
end

When(/^I search the second table cell located in a table in a section$/) do
  @cell = @page.container.section_cell_element
end

Then(/^the section table cell should contain "([^"]*)"$/) do |value|
  expect(@cell.text).to eql value
end

When(/^I search for an image located in a section$/) do
  @image = @page.container.section_image_element
end

Then(/^the section image should be "([^"]*)" pixels wide$/) do |width|
  expect(@image.width).to eql width.to_i
end

Then(/^the section image should be "([^"]*)" pixels tall$/) do |height|
  expect(@image.height).to eql height.to_i
end

When(/^I search for a form located in a section$/) do
  @form = @page.container.section_form_element
end

Then(/^I should be able to submit the section form$/) do
  @form.submit
end

When(/^I search for an ordered list located in a section$/) do
  @list = @page.container.section_ordered_list_element
end

Then(/^the first section list items text should be "([^"]*)"$/) do |value|
  expect(@list[0].text).to eql value
end

When(/^I search for an unordered list located in a section$/) do
  @list = @page.container.section_unordered_list_element
end

When(/^I search for a list item section in an ordered list in a section$/) do
  @li = @page.container.section_list_item_element
end

Then(/^I should see the section list items text should be "([^"]*)"$/) do |value|
  expect(@li.text).to eql value
end

When(/^I search for a h(\d+) located in a section$/) do |num|
  @header = @page.container.send "section_h#{num}_element"
end

Then(/^I should see the section h(\d+)s text should be "([^"]*)"$/) do |num, value|
  expect(@header.text).to eql value
end

When(/^I search for a paragraph located in a section$/) do
  @paragraph = @page.container.section_paragraph_element
end

Then(/^I should see the section paragraphs text should be "([^"]*)"$/) do |value|
  expect(@paragraph.text).to eql value
end

When(/^I select multiple sections$/) do
  @sections = @page.page_inputs
end

Then(/^I should have a section collection containing the sections$/) do
  expect(@sections).to be_instance_of Druid::SectionCollection
end

Then(/^I can access any index of that collection of sections$/) do
  expect(@sections[0]).to be_a(Druid)
  expect(@sections[-1]).to be_a(Druid)
end

When(/^I search by a specific value of the section$/) do
  @element = @sections.find_by(:value => 'LeanDog')
end

Then(/^I will find the first section with that value$/) do
  expect(@element).to be_a(Druid)
  expect(@element.value). to eq 'LeanDog'
end

When(/^I filter by a specific value of the sections$/) do
  @elements = @sections.select_by(:value => /\w+/)
end

Then(/^I will find all sections with that value$/) do
  expect(@elements).to be_a Druid::SectionCollection
  @elements.map(&:value).each do |element|
    expect(element).to match(/\w+/)
  end
end
