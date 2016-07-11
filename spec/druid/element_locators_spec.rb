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
end
