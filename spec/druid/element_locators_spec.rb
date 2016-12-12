require 'spec_helper'

class ElementLocatorsTestDruid
  include Druid
end

describe Druid::ElementLocators do
  let(:driver) { mock_driver }
  let(:page) { ElementLocatorsTestDruid.new(driver) }

  it "should find a button element" do
    expect(driver).to receive(:button).with(:id => 'blah').and_return(driver)
    button = page.button_element(:id => 'blah')
    expect(button).to be_instance_of Druid::Elements::Button
  end

  it "should find all button elements" do
    expect(driver).to receive(:buttons).with(:id => 'blah').and_return([driver])
    elements = page.button_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Button
  end

  it "should find a text field element" do
    expect(driver).to receive(:text_field).with(:id => 'blah').and_return(driver)
    text_field = page.text_field_element(:id => 'blah')
    expect(text_field).to be_instance_of Druid::Elements::TextField
  end

  it "should find all text field elemnts" do
    expect(driver).to receive(:text_fields).with(:id => 'blah').and_return([driver])
    elements = page.text_field_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::TextField
  end

  it "should find a hidden field element" do
    expect(driver).to receive(:hidden).with(:id => 'blah').and_return(driver)
    element = page.hidden_field_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::HiddenField
  end

  it "should find all hidden field elements" do
    expect(driver).to receive(:hiddens).with(:id => 'blah').and_return([driver])
    elements = page.hidden_field_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::HiddenField
  end

  it "should find a text area element" do
    expect(driver).to receive(:textarea).with(:id => 'blah').and_return(driver)
    element = page.text_area_element(:id => "blah")
    expect(element).to be_instance_of Druid::Elements::TextArea
  end

  it "should find a select list element" do
    expect(driver).to receive(:select_list).with(:id => 'blah').and_return(driver)
    element = page.select_list_element(:id => "blah")
    expect(element).to be_instance_of Druid::Elements::SelectList
  end

  it "should find a link element" do
    expect(driver).to receive(:link).with(:id => 'blah').and_return(driver)
    element = page.link_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Link
  end

  it "should find a check box element" do
    expect(driver).to receive(:checkbox).with(:id => 'blah').and_return(driver)
    element = page.checkbox_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::CheckBox
  end

  it "should find a radio button element" do
    expect(driver).to receive(:radio).with(:id => 'blah').and_return(driver)
    element = page.radio_button_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::RadioButton
  end

  it "should find a div element" do
    expect(driver).to receive(:div).with(:id => 'blah').and_return(driver)
    element = page.div_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Div
  end

  it "should find a span element" do
    expect(driver).to receive(:span).with(:id => 'blah').and_return(driver)
    element = page.span_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Span
  end

  it "should find a table element" do
    expect(driver).to receive(:table).with(:id => 'blah').and_return(driver)
    element = page.table_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Table
  end

  it "should find a table cell element" do
    expect(driver).to receive(:td).with(:id => 'blah').and_return(driver)
    element = page.cell_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::TableCell
  end

  it "should find an image element" do
    expect(driver).to receive(:image).with(:id => 'blah').and_return(driver)
    element = page.image_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Image
  end

  it "should find a form element" do
    expect(driver).to receive(:form).with(:id => 'blah').and_return(driver)
    element = page.form_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Form
  end

  it "should find a list item element" do
    expect(driver).to receive(:li).with(:id => 'blah').and_return(driver)
    element = page.list_item_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::ListItem
  end

  it "should find an ordered list element" do
    expect(driver).to receive(:ol).with(:id => 'blah').and_return(driver)
    element = page.ordered_list_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::OrderedList
  end

  it "should find an unordered list element" do
    expect(driver).to receive(:ul).with(:id => 'blah').and_return(driver)
    element = page.unordered_list_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::UnOrderedList
  end

  it "should find a h1 element" do
    expect(driver).to receive(:h1).with(:id => 'blah').and_return(driver)
    element = page.h1_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Heading
  end

  it "should find a h2 element" do
    expect(driver).to receive(:h2).with(:id => 'blah').and_return(driver)
    element = page.h2_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Heading
  end

  it "should find a h3 element" do
    expect(driver).to receive(:h3).with(:id => 'blah').and_return(driver)
    element = page.h3_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Heading
  end

  it "should find a h4 element" do
    expect(driver).to receive(:h4).with(:id => 'blah').and_return(driver)
    element = page.h4_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Heading
  end

  it "should find a h5 element" do
    expect(driver).to receive(:h5).with(:id => 'blah').and_return(driver)
    element = page.h5_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Heading
  end

  it "should find a h6 element" do
    expect(driver).to receive(:h6).with(:id => 'blah').and_return(driver)
    element = page.h6_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Heading
  end

  it "should find a paragraph element" do
    expect(driver).to receive(:p).with(:id => 'blah').and_return(driver)
    element = page.paragraph_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Paragraph
  end

  it "should find a file field element" do
    expect(driver).to receive(:file_field).with(:id => 'blah').and_return(driver)
    element = page.file_field_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::FileField
  end
end
