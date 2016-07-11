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
end
