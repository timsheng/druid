require 'spec_helper'
require 'druid/elements'

describe "Element with nested elements" do
  let(:we) { double 'we'}
  let(:element) { Druid::Elements::Element.new(we) }
  let(:driver) { driver = element}

  it "should find nested links" do
    expect(we).to receive(:link).with(:id => 'blah').and_return(driver)
    element.link_element(:id => 'blah')
  end

  it "should find nested buttons" do
    expect(we).to receive(:button).with(:id => 'blah').and_return(driver)
    element.button_element(:id => 'blah')
  end

  it "should find nested text fields" do
    expect(we).to receive(:text_field).with(:id => 'blah').and_return(driver)
    element.text_field_element(:id => 'blah')
  end

  it "should find nested hidden fields" do
    expect(we).to receive(:hidden).and_return(driver)
    element.hidden_field_element
  end

  it "should find nested text areas" do
    expect(we).to receive(:textarea).and_return(driver)
    element.text_area_element
  end

  it "should find nested select list" do
    expect(we).to receive(:select_list).and_return(driver)
    element.select_list_element
  end

  it "should find a nested checkbox" do
    expect(we).to receive(:checkbox).and_return(driver)
    element.checkbox_element
  end

  it "should find a nested radio button" do
    expect(we).to receive(:radio).and_return(driver)
    element.radio_button_element
  end

  it "should find a nested div" do
    expect(we).to receive(:div).and_return(driver)
    element.div_element
  end

  it "should find a nested span" do
    expect(we).to receive(:span).and_return(driver)
    element.span_element
  end

end
