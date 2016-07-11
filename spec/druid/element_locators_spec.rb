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

  it "should find a text field element" do
    expect(driver).to receive(:text_field).with(:id => 'blah').and_return(driver)
    text_field = page.text_field_element(:id => 'blah')
    expect(text_field).to be_instance_of Druid::Elements::TextField
  end

  it "should find a hidden field element" do
    expect(driver).to receive(:hidden).with(:id => 'blah').and_return(driver)
    element = page.hidden_field_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::HiddenField
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
end
