require 'spec_helper'
require 'druid/elements'

describe "Element with nested elements" do
  let(:we) { double 'we' }
  let(:driver) { double 'driver' }
  let(:element) { Druid::Elements::Element.new(we, driver)}

  it "should find nested links" do
    expect(driver).to receive(:link).with(:id => 'blah').and_return(driver)
    element.link_element(:id => 'blah')
  end

  it "should find nested buttons" do
    expect(driver).to receive(:button).with(:id => 'blah').and_return(driver)
    element.button_element(:id => 'blah')
  end

  it "should find nested text fields" do
    expect(driver).to receive(:text_field).with(:id => 'blah').and_return(driver)
    element.text_field_element(:id => 'blah')
  end

  it "should find nested hidden fields" do
    expect(driver).to receive(:hidden).and_return(driver)
    element.hidden_field_element
  end

  it "should find nested text areas" do
    expect(driver).to receive(:textarea).and_return(driver)
    element.text_area_element
  end

end
