require 'spec_helper'

class ElementLocatorsTestDruid
  include Druid
end

describe Druid::ElementLocators do
  let(:driver) { mock_driver }
  let(:page) { ElementLocatorsTestDruid.new(driver) }

  it "should find a button element" do
    expect(driver).to receive(:button).with(:id => 'blah').and_return(driver)
    element = page.button_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Button
  end

  it "should find a button element using a default identifier" do
    expect(driver).to receive(:button).with(:index => 0).and_return(driver)
    page.button_element
  end

  it "should find all button elements" do
    expect(driver).to receive(:buttons).with(:id => 'blah').and_return([driver])
    elements = page.button_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Button
  end

  it "should find all buttons with no identifier" do
    expect(driver).to receive(:buttons).with({}).and_return([driver])
    page.button_elements
  end

  it "should find a text field element" do
    expect(driver).to receive(:text_field).with(:id => 'blah').and_return(driver)
    element = page.text_field_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::TextField
  end

  it "should find a text field element using a default identifier" do
    expect(driver).to receive(:text_field).with(:index => 0).and_return(driver)
    page.text_field_element
  end

  it "should find all text field elemnts" do
    expect(driver).to receive(:text_fields).with(:id => 'blah').and_return([driver])
    expect(driver).to receive(:tag_name).and_return('input')
    elements = page.text_field_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::TextField
  end

  it "should find all text fields with no identifier" do
    expect(driver).to receive(:text_fields).with({}).and_return([driver])
    expect(driver).to receive(:tag_name).and_return('input')
    page.text_field_elements
  end

  it "should find a hidden field element" do
    expect(driver).to receive(:hidden).with(:id => 'blah').and_return(driver)
    element = page.hidden_field_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::HiddenField
  end

  it "should find a hidden field element using a default identifier" do
    expect(driver).to receive(:hidden).with(:index => 0).and_return(driver)
    page.hidden_field_element
  end

  it "should find all hidden field elements" do
    expect(driver).to receive(:hiddens).with(:id => 'blah').and_return([driver])
    elements = page.hidden_field_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::HiddenField
  end

  it "should find all hidden fields using no identifier" do
    expect(driver).to receive(:hiddens).with({}).and_return([driver])
    page.hidden_field_elements
  end

  it "should find a text area element" do
    expect(driver).to receive(:textarea).with(:id => 'blah').and_return(driver)
    element = page.text_area_element(:id => "blah")
    expect(element).to be_instance_of Druid::Elements::TextArea
  end

  it "should find a text area element using a default identifier" do
    expect(driver).to receive(:textarea).with(:index => 0).and_return(driver)
    page.text_area_element
  end

  it "should find all text area elements" do
    expect(driver).to receive(:textareas).with(:id => 'blah').and_return([driver])
    elements = page.text_area_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::TextArea
  end

  it "should find all text areas using no identifier" do
    expect(driver).to receive(:textareas).with({}).and_return([driver])
    page.text_area_elements
  end

  it "should find a select list element" do
    expect(driver).to receive(:select_list).with(:id => 'blah').and_return(driver)
    element = page.select_list_element(:id => "blah")
    expect(element).to be_instance_of Druid::Elements::SelectList
  end

  it "should find a select list element using a default identifier" do
    expect(driver).to receive(:select_list).with(:index => 0).and_return(driver)
    page.select_list_element
  end

  it "should find all select list elements" do
    expect(driver).to receive(:select_lists).with(:id => 'blah').and_return([driver])
    elements = page.select_list_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::SelectList
  end

  it "should find all select lists using no identifier" do
    expect(driver).to receive(:select_lists).with({}).and_return([driver])
    page.select_list_elements
  end

  it "should find a link element" do
    expect(driver).to receive(:link).with(:id => 'blah').and_return(driver)
    element = page.link_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Link
  end

  it "should find a link element using a default identifier" do
    expect(driver).to receive(:link).with(:index => 0).and_return(driver)
    page.link_element
  end

  it "should find all link elements" do
    expect(driver).to receive(:links).with(:id => 'blah').and_return([driver])
    elements = page.link_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Link
  end

  it "should find all links using no identifier" do
    expect(driver).to receive(:links).with({}).and_return([driver])
    page.link_elements
  end

  it "should find a check box element" do
    expect(driver).to receive(:checkbox).with(:id => 'blah').and_return(driver)
    element = page.checkbox_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::CheckBox
  end

  it "should find a check box element using a default identifier" do
    expect(driver).to receive(:checkbox).with(:index => 0).and_return(driver)
    page.checkbox_element
  end

  it "should find all check box elements" do
    expect(driver).to receive(:checkboxes).with(:id => 'blah').and_return([driver])
    elements = page.checkbox_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::CheckBox
  end

  it "should find all checkboxes using no identifier" do
    expect(driver).to receive(:checkboxes).with({}).and_return([driver])
    page.checkbox_elements
  end

  it "should find a radio button element" do
    expect(driver).to receive(:radio).with(:id => 'blah').and_return(driver)
    element = page.radio_button_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::RadioButton
  end

  it "should find a radio button element using a default identifier" do
    expect(driver).to receive(:radio).with(:index => 0).and_return(driver)
    page.radio_button_element
  end

  it "should find all radio button elements" do
    expect(driver).to receive(:radios).with(:id => 'blah').and_return([driver])
    elements = page.radio_button_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::RadioButton
  end

  it "should find all radio buttons using no identifier" do
    expect(driver).to receive(:radios).with({}).and_return([driver])
    page.radio_button_elements
  end

  it "should find a div element" do
    expect(driver).to receive(:div).with(:id => 'blah').and_return(driver)
    element = page.div_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Div
  end

  it "should find a div element using a default identifier" do
    expect(driver).to receive(:div).with(:index => 0).and_return(driver)
    page.div_element
  end

  it "should find all div elements" do
    expect(driver).to receive(:divs).with(:id => 'blah').and_return([driver])
    elements = page.div_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Div
  end

  it "should find all divs using no identifier" do
    expect(driver).to receive(:divs).with({}).and_return([driver])
    page.div_elements
  end

  it "should find a span element" do
    expect(driver).to receive(:span).with(:id => 'blah').and_return(driver)
    element = page.span_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Span
  end

  it "should find a span element using a default identifier" do
    expect(driver).to receive(:span).with(:index => 0).and_return(driver)
    page.span_element
  end

  it "should find all span elements" do
    expect(driver).to receive(:spans).with(:id => 'blah').and_return([driver])
    elements = page.span_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Span
  end

  it "should find all spans using no identifier" do
    expect(driver).to receive(:spans).with({}).and_return([driver])
    page.span_elements
  end

  it "should find a table element" do
    expect(driver).to receive(:table).with(:id => 'blah').and_return(driver)
    element = page.table_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Table
  end

  it "should find a table element using a default identifier" do
    expect(driver).to receive(:table).with(:index => 0).and_return(driver)
    page.table_element
  end

  it "should find all table elements" do
    expect(driver).to receive(:tables).with(:id => 'blah').and_return([driver])
    elements = page.table_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Table
  end

  it "should find all tables using no identifier" do
    expect(driver).to receive(:tables).with({}).and_return([driver])
    page.table_elements
  end

  it "should find a table cell element" do
    expect(driver).to receive(:td).with(:id => 'blah').and_return(driver)
    element = page.cell_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::TableCell
  end

  it "should find a table cell element using a default identifier" do
    expect(driver).to receive(:td).with(:index => 0).and_return(driver)
    page.cell_element
  end

  it "should find all table cells" do
    expect(driver).to receive(:tds).with(:id => 'blah').and_return([driver])
    elements = page.cell_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::TableCell
  end

  it "should find all table cells using no identifier" do
    expect(driver).to receive(:tds).with({}).and_return([driver])
    page.cell_elements
  end

  it "should find a table row" do
    expect(driver).to receive(:tr).with(:id => 'blah').and_return(driver)
    element = page.row_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::TableRow
  end

  it "should find a table row using a default identifier" do
    expect(driver).to receive(:tr).with(:index => 0).and_return(driver)
    page.row_element
  end

  it "should find all table row" do
    expect(driver).to receive(:trs).with(:id => 'blah').and_return([driver])
    elements = page.row_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::TableRow
  end

  it "should find all table rows using no identifier" do
    expect(driver).to receive(:trs).with({}).and_return([driver])
    page.row_elements
  end

  it "should find an image element" do
    expect(driver).to receive(:image).with(:id => 'blah').and_return(driver)
    element = page.image_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Image
  end

  it "should find a image element using a default identifier" do
    expect(driver).to receive(:image).with(:index => 0).and_return(driver)
    page.image_element
  end

  it "should find all image elements" do
    expect(driver).to receive(:images).with(:id => 'blah').and_return([driver])
    elements = page.image_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Image
  end

  it "should find all images using no identifier" do
    expect(driver).to receive(:images).with({}).and_return([driver])
    page.image_elements
  end

  it "should find a form element" do
    expect(driver).to receive(:form).with(:id => 'blah').and_return(driver)
    element = page.form_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Form
  end

  it "should find a form element using a default identifier" do
    expect(driver).to receive(:form).with(:index => 0).and_return(driver)
    page.form_element
  end

  it "should find all form elements" do
    expect(driver).to receive(:forms).with(:id => 'blah').and_return([driver])
    elements = page.form_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Form
  end

  it "should find all forms using no identifier" do
    expect(driver).to receive(:forms).with({}).and_return([driver])
    page.form_elements
  end

  it "should find a list item element" do
    expect(driver).to receive(:li).with(:id => 'blah').and_return(driver)
    element = page.list_item_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::ListItem
  end

  it "should find a list item element using a default identifier" do
    expect(driver).to receive(:li).with(:index => 0).and_return(driver)
    page.list_item_element
  end

  it "should find all list item elements" do
    expect(driver).to receive(:lis).with(:id => 'blah').and_return([driver])
    elements = page.list_item_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::ListItem
  end

  it "should find all list items using no identifier" do
    expect(driver).to receive(:lis).with({}).and_return([driver])
    page.list_item_elements
  end

  it "should find an ordered list element" do
    expect(driver).to receive(:ol).with(:id => 'blah').and_return(driver)
    element = page.ordered_list_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::OrderedList
  end

  it "should find an ordered list element using a default identifier" do
    expect(driver).to receive(:ol).with(:index => 0).and_return(driver)
    page.ordered_list_element
  end

  it "should find all ordered list elements" do
    expect(driver).to receive(:ols).with(:id => 'blah').and_return([driver])
    elements = page.ordered_list_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::OrderedList
  end

  it "should find all ordered lists using no identifier" do
    expect(driver).to receive(:ols).with({}).and_return([driver])
    page.ordered_list_elements
  end

  it "should find an unordered list element" do
    expect(driver).to receive(:ul).with(:id => 'blah').and_return(driver)
    element = page.unordered_list_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::UnOrderedList
  end

  it "should find an unordered list element using a default identifier" do
    expect(driver).to receive(:ul).with(:index => 0).and_return(driver)
    page.unordered_list_element
  end

  it "should find all unordered list elements" do
    expect(driver).to receive(:uls).with(:id => 'blah').and_return([driver])
    elements = page.unordered_list_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::UnOrderedList
  end

  it "should find all unordered lists using no identifier" do
    expect(driver).to receive(:uls).with({}).and_return([driver])
    page.unordered_list_elements
  end

  it "should find a h1 element" do
    expect(driver).to receive(:h1).with(:id => 'blah').and_return(driver)
    element = page.h1_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Heading
  end

  it "should find a h1 element using a default identifier" do
    expect(driver).to receive(:h1).with(:index => 0).and_return(driver)
    page.h1_element
  end

  it "should find all h1 elements" do
    expect(driver).to receive(:h1s).with(:id => 'blah').and_return([driver])
    elements = page.h1_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Heading
  end

  it "should find all h1s using no identifier" do
    expect(driver).to receive(:h1s).with({}).and_return([driver])
    page.h1_elements
  end

  it "should find a h2 element" do
    expect(driver).to receive(:h2).with(:id => 'blah').and_return(driver)
    element = page.h2_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Heading
  end

  it "should find a h2 element using a default identifier" do
    expect(driver).to receive(:h2).with(:index => 0).and_return(driver)
    page.h2_element
  end

  it "should find all h2 elements" do
    expect(driver).to receive(:h2s).with(:id => 'blah').and_return([driver])
    elements = page.h2_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Heading
  end

  it "should find all h2s using no identifier" do
    expect(driver).to receive(:h2s).with({}).and_return([driver])
    page.h2_elements
  end

  it "should find a h3 element" do
    expect(driver).to receive(:h3).with(:id => 'blah').and_return(driver)
    element = page.h3_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Heading
  end

  it "should find a h3 element using a default identifier" do
    expect(driver).to receive(:h3).with(:index => 0).and_return(driver)
    page.h3_element
  end

  it "should find all h3 elements" do
    expect(driver).to receive(:h3s).with(:id => 'blah').and_return([driver])
    elements = page.h3_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Heading
  end

  it "should find all h3s using no identifier" do
    expect(driver).to receive(:h3s).with({}).and_return([driver])
    page.h3_elements
  end

  it "should find a h4 element" do
    expect(driver).to receive(:h4).with(:id => 'blah').and_return(driver)
    element = page.h4_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Heading
  end

  it "should find a h4 element using a default identifier" do
    expect(driver).to receive(:h4).with(:index => 0).and_return(driver)
    page.h4_element
  end

  it "should find all h4 elements" do
    expect(driver).to receive(:h4s).with(:id => 'blah').and_return([driver])
    elements = page.h4_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Heading
  end

  it "should find all h4s using no identifier" do
    expect(driver).to receive(:h4s).with({}).and_return([driver])
    page.h4_elements
  end

  it "should find a h5 element" do
    expect(driver).to receive(:h5).with(:id => 'blah').and_return(driver)
    element = page.h5_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Heading
  end

  it "should find a h5 element using a default identifier" do
    expect(driver).to receive(:h5).with(:index => 0).and_return(driver)
    page.h5_element
  end

  it "should find all h5 elements" do
    expect(driver).to receive(:h5s).with(:id => 'blah').and_return([driver])
    elements = page.h5_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Heading
  end

  it "should find all h5s using no identifier" do
    expect(driver).to receive(:h5s).with({}).and_return([driver])
    page.h5_elements
  end

  it "should find a h6 element" do
    expect(driver).to receive(:h6).with(:id => 'blah').and_return(driver)
    element = page.h6_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Heading
  end

  it "should find a h6 element using a default identifier" do
    expect(driver).to receive(:h6).with(:index => 0).and_return(driver)
    page.h6_element
  end

  it "should find all h6 elements" do
    expect(driver).to receive(:h6s).with(:id => 'blah').and_return([driver])
    elements = page.h6_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Heading
  end

  it "should find all h6s using no identifier" do
    expect(driver).to receive(:h6s).with({}).and_return([driver])
    page.h6_elements
  end

  it "should find a paragraph element" do
    expect(driver).to receive(:p).with(:id => 'blah').and_return(driver)
    element = page.paragraph_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Paragraph
  end

  it "should find all paragraph elements" do
    expect(driver).to receive(:ps).with(:id => 'blah').and_return([driver])
    elements = page.paragraph_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Paragraph
  end

  it "should find a paragraph element using a default identifier" do
    expect(driver).to receive(:p).with(:index => 0).and_return(driver)
    page.paragraph_element
  end

  it "should find all paragraphs using no identifier" do
    expect(driver).to receive(:ps).with({}).and_return([driver])
    page.paragraph_elements
  end

  it "should find a file field element" do
    expect(driver).to receive(:file_field).with(:id => 'blah').and_return(driver)
    element = page.file_field_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::FileField
  end

  it "should find a file field element using a default identifier" do
    expect(driver).to receive(:file_field).with(:index => 0).and_return(driver)
    page.file_field_element
  end

  it "should find all file field elements" do
    expect(driver).to receive(:file_fields).with(:id => 'blah').and_return([driver])
    element = page.file_field_elements(:id => 'blah')
    expect(element[0]).to be_instance_of Druid::Elements::FileField
  end

  it "should find all file fields using no identifier" do
    expect(driver).to receive(:file_fields).with({}).and_return([driver])
    page.file_field_elements
  end

  it "should find a label" do
    expect(driver).to receive(:label).with(:id => 'blah').and_return(driver)
    element = page.label_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Label
  end

  it "should find a label element using a default identifier" do
    expect(driver).to receive(:label).with(:index => 0).and_return(driver)
    page.label_element
  end

  it "should find all label elements" do
    expect(driver).to receive(:labels).with(:id => 'blah').and_return([driver])
    elements = page.label_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Label
  end

  it "should find all labels using no identifier" do
    expect(driver).to receive(:labels).with({}).and_return([driver])
    page.label_elements
  end

  it "should find an audio element" do
    expect(driver).to receive(:audio).with(:id => 'blah').and_return(driver)
    element = page.audio_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Audio
  end

  it "should find an audio element using a default identifier" do
    expect(driver).to receive(:audio).with(:index => 0).and_return(driver)
    page.audio_element
  end

  it "should find an area element" do
    expect(driver).to receive(:area).with(:id => 'blah').and_return(driver)
    element = page.area_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Area
  end

  it "should find an area element using a default identifier" do
    expect(driver).to receive(:area).with(:index => 0).and_return(driver)
    page.area_element
  end

  it "should find all area elements" do
    expect(driver).to receive(:areas).with(:id => 'blah').and_return([driver])
    elements = page.area_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Area
  end

  it "should find all areas with no identifier" do
    expect(driver).to receive(:areas).with({}).and_return([driver])
    page.area_elements
  end

  it "should find a canvas element" do
    expect(driver).to receive(:canvas).with(:id => 'blah').and_return(driver)
    element = page.canvas_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Canvas
  end

  it "should find a canvas element using a default identifier" do
    expect(driver).to receive(:canvas).with(:index => 0).and_return(driver)
    page.canvas_element
  end

  it "should find all canvas elements" do
    expect(driver).to receive(:canvases).with(:id => 'blah').and_return([driver])
    elements = page.canvas_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Canvas
  end

  it "should find all canvas elements with no identifier" do
    expect(driver).to receive(:canvases).with({}).and_return([driver])
    page.canvas_elements
  end

  it "should find an audio element" do
    expect(driver).to receive(:audio).with(:id => 'blah').and_return(driver)
    element = page.audio_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Audio
  end

  it "should find an audio element using a default identifier" do
    expect(driver).to receive(:audio).with(:index => 0).and_return(driver)
    page.audio_element
  end

  it "should find all audios elements" do
    expect(driver).to receive(:audios).with(:id => 'blah').and_return([driver])
    elements = page.audio_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Audio
  end

  it "should find all audios elements with no identifier" do
    expect(driver).to receive(:audios).with({}).and_return([driver])
    page.audio_elements
  end

  it "should find an video element" do
    expect(driver).to receive(:video).with(:id => 'blah').and_return(driver)
    element = page.video_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Video
  end

  it "should find an video element using a default identifier" do
    expect(driver).to receive(:video).with(:index => 0).and_return(driver)
    page.video_element
  end

  it "should find all videos elements" do
    expect(driver).to receive(:videos).with(:id => 'blah').and_return([driver])
    elements = page.video_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Video
  end

  it "should find all videos elements with no identifier" do
    expect(driver).to receive(:videos).with({}).and_return([driver])
    page.video_elements
  end

  it "should find a b element" do
    expect(driver).to receive(:b).with(:id => 'blah').and_return(driver)
    element = page.b_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Bold
  end

  it "should find a b element using a default identifier" do
    expect(driver).to receive(:b).with(:index => 0).and_return(driver)
    page.b_element
  end

  it "should find all b elements" do
    expect(driver).to receive(:bs).with(:id => 'blah').and_return([driver])
    elements = page.b_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Bold
  end

  it "should find all b elements using no parameters" do
    expect(driver).to receive(:bs).with({}).and_return([driver])
    page.b_elements
  end

  it "should find a i element" do
    expect(driver).to receive(:i).with(:id => 'blah').and_return(driver)
    element = page.i_element(:id => 'blah')
    expect(element).to be_instance_of Druid::Elements::Italic
  end

  it "should find a i element using a default identifier" do
    expect(driver).to receive(:i).with(:index => 0).and_return(driver)
    page.i_element
  end

  it "should find all i elements" do
    expect(driver).to receive(:is).with(:id => 'blah').and_return([driver])
    elements = page.i_elements(:id => 'blah')
    expect(elements[0]).to be_instance_of Druid::Elements::Italic
  end

  it "should find all b elements using no parameters" do
    expect(driver).to receive(:is).with({}).and_return([driver])
    page.i_elements
  end

end
