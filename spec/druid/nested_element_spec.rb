require 'spec_helper'
require 'druid/elements'

describe "Element with nested elements" do
  let(:we) { double 'we'}
  let(:element) { Druid::Elements::Element.new(we) }
  let(:driver) { driver = element}

  it "should find nested links" do
    expect(we).to receive(:link).with(:id => 'blah').and_return(we)
    element.link_element(:id => 'blah')
  end

  it "should find nested buttons" do
    expect(we).to receive(:button).with(:id => 'blah').and_return(we)
    element.button_element(:id => 'blah')
  end

  it "should find nested text fields" do
    expect(we).to receive(:text_field).with(:id => 'blah').and_return(we)
    element.text_field_element(:id => 'blah')
  end

  it "should find nested hidden fields" do
    expect(we).to receive(:hidden).and_return(we)
    element.hidden_field_element
  end

  it "should find nested text areas" do
    expect(we).to receive(:textarea).and_return(we)
    element.text_area_element
  end

  it "should find nested select list" do
    expect(we).to receive(:select_list).and_return(we)
    element.select_list_element
  end

  it "should find a nested checkbox" do
    expect(we).to receive(:checkbox).and_return(we)
    element.checkbox_element
  end

  it "should find a nested radio button" do
    expect(we).to receive(:radio).and_return(we)
    element.radio_button_element
  end

  it "should find a nested div" do
    expect(we).to receive(:div).and_return(we)
    element.div_element
  end

  it "should find a nested span" do
    expect(we).to receive(:span).and_return(we)
    element.span_element
  end

  it "should find a nested table" do
    expect(we).to receive(:table).and_return(we)
    element.table_element
  end

  it "should find a nested cell" do
    expect(we).to receive(:td).and_return(we)
    element.cell_element
  end

  it "should find a nested image" do
    expect(we).to receive(:image).and_return(we)
    element.image_element
  end

  it "should find a nested form" do
    expect(we).to receive(:form).and_return(we)
    element.form_element
  end

  it "should find a nested ordered list" do
    expect(we).to receive(:ol).and_return(we)
    element.ordered_list_element
  end

  it "should find a nested unordered list" do
    expect(we).to receive(:ul).and_return(we)
    element.unordered_list_element
  end

  it "should find a nested list item" do
    expect(we).to receive(:li).and_return(we)
    element.list_item_element
  end

  it "should find a nested h1" do
    expect(we).to receive(:h1).and_return(we)
    element.h1_element
  end

  it "should find a nested h2" do
    expect(we).to receive(:h2).and_return(we)
    element.h2_element
  end

  it "should find a nested h3" do
    expect(we).to receive(:h3).and_return(we)
    element.h3_element
  end

  it "should find a nested h4" do
    expect(we).to receive(:h4).and_return(we)
    element.h4_element
  end

  it "should find a nested h5" do
    expect(we).to receive(:h5).and_return(we)
    element.h5_element
  end

  it "should find a nested h6" do
    expect(we).to receive(:h6).and_return(we)
    element.h6_element
  end

end
