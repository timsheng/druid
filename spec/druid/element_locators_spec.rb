require 'spec_helper'

class ElementLocatorsTestDruid
  include Druid
end

describe Druid::ElementLocators do
  let(:driver) { mock_driver }
  let(:page) { ElementLocatorsTestDruid.new(driver) }

  it "should find a button element" do
    expect(driver).to receive(:button).with(:id => 'blah').and_return(driver)
    button = page.button(:id => 'blah')
    expect(button).to be_instance_of Druid::Elements::Button
  end

  it "should find a text field element" do
    expect(driver).to receive(:text_field).with(:id => 'blah').and_return(driver)
    text_field = page.text_field(:id => 'blah')
    expect(text_field).to be_instance_of Druid::Elements::TextField
  end
end
