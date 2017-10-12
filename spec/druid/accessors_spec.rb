require 'spec_helper'

class GenericPage
  include Druid

  wait_for_expected_title 'expected title'
end

class AccessorsTestDruid
  include Druid

  page_url "http://apple.com"
  expected_title "Expected Title"
  expected_element :google_search
  link(:google_search, :link => 'Google Search')
  text_field(:first_name, :id => 'first_name')
  select_list(:state, :id => 'state')
  checkbox(:active, :id => 'is_active_id')
  button(:click_me, :id => 'button_submit')
  radio_button(:first, :id => 'first_choice')
  div(:message, :id => 'message_id')
  table(:cart, :id => 'cart_id')
  cell(:total, :id => 'total')
  span(:alert_span, :id => 'alert_id')
  image(:logo, :id => 'logo')
  hidden_field(:social_security_number, :id => 'ssn')
  form(:login, :id => 'login')
  text_area(:address, :id => 'address')
  list_item(:item_one, :id => 'one')
  unordered_list(:menu, :id => 'main_menu')
  ordered_list(:top_five, :id => 'top')
  h1(:heading1, :id => 'main_heading')
  h2(:heading2, :id => 'main_heading')
  h3(:heading3, :id => 'main_heading')
  h4(:heading4, :id => 'main_heading')
  h5(:heading5, :id => 'main_heading')
  h6(:heading6, :id => 'main_heading')
  paragraph(:first_para, :id => 'first')
  file_field(:upload_me, :id => 'the_file')
  area(:img_area, :id => 'area')
  canvas(:my_canvas, :id => 'canvas_id')
  audio(:acdc, :id => 'audio_id')
  video(:movie, :id => 'video_id')
  b(:bold, :id => 'bold')
end

class BlockDruid
  include Druid

  text_field :first_name do |element|
    "text_field"
  end
  hidden_field :secret do |element|
    "hidden_field"
  end
  text_area :address do |element|
    "text_area"
  end
  select_list :state do |element|
    "select_list"
  end
  link :continue do |element|
    "link"
  end
  checkbox :active do |element|
    "checkbox"
  end
  radio_button :first do |element|
    "radio_button"
  end
  button :click_me do |element|
    "button"
  end
  div :footer do |element|
    "div"
  end
  span :alert_span do |element|
    "span"
  end
  table :cart do |element|
    "table"
  end
  cell :total do |element|
    "cell"
  end
  image :logo do |element|
    "image"
  end
  form :login do |element|
    "form"
  end
  list_item :item_one do |element|
    "list_item"
  end
  unordered_list :menu do |element|
    "unordered_list"
  end
  ordered_list :top_five do |element|
    "ordered_list"
  end
  h1 :heading1 do |element|
    "h1"
  end
  h2 :heading2 do |element|
    "h2"
  end
  h3 :heading3 do |element|
    "h3"
  end
  h4 :heading4 do |element|
    "h4"
  end
  h5 :heading5 do |element|
    "h5"
  end
  h6 :heading6 do |element|
    "h6"
  end
  paragraph :first_para do |element|
    "p"
  end
  file_field :a_file do |element|
    "file_field"
  end
  area :img_area do |element|
    "area"
  end
  canvas :my_canvas do |element|
    "canvas"
  end
  audio :acdc do |element|
    "audio"
  end
  video :movie do |element|
    "video"
  end
  b :bold do |element|
    "b"
  end
end

class TestDruidBackUp
  include Druid
end

describe Druid::Accessors do
  let(:driver) { mock_driver }
  let(:druid) { AccessorsTestDruid.new(driver) }
  let(:block_druid) { BlockDruid.new(driver) }


  describe "goto a page" do
    it "should navigate to a page when requested" do
      expect(driver).to receive(:goto)
      AccessorsTestDruid.new(driver, true)
    end

    it "should call a method when page_url called with a symbol" do
      class SymbolPageUrl
        include Druid
        page_url :custom_url

        attr_reader :custom_url

        def initialize(d, v, url)
          @custom_url = url
          super(d, v)
        end
      end
      expect(driver).to receive(:goto).with("custom")
      SymbolPageUrl.new(driver, true, 'custom')
      expect(driver).to receive(:goto).with('different')
      SymbolPageUrl.new(driver, true, 'different')
    end

    it "should not navigate to a page when not requested" do
      expect(driver).not_to receive(:goto)
      AccessorsTestDruid.new(driver)
    end

    it "should not navigate to a page when 'page_url' not specified" do
      expect(driver).not_to receive(:goto)
      TestDruidBackUp.new(driver,true)
    end

    it "should provide the page url" do
      expect(druid.page_url_value).to eql "http://apple.com"
    end
  end

  describe "validating the page title" do
    it "should validate the title" do
      expect(driver).to receive(:title).and_return("Expected Title")
      expect(druid).to have_expected_title
    end

    it "should validate the by regexp" do
      class RegexpExpectedTitle
        include Druid
        expected_title /\w+ \w+/
      end
      expect(driver).to receive(:title).and_return("Expected Title")
      expect(RegexpExpectedTitle.new(driver)).to have_expected_title
    end

    it "should raise error when it does not have expected title" do
      expect(driver).to receive(:title).and_return("Not Expected")
      expect {druid.has_expected_title? }.to raise_error "Expected title \'Expected Title\' instead of \'Not Expected\'"
    end
  end

  describe "validating the existence of an element" do
    it "should validate an element exists" do
      allow(druid).to receive(:google_search_element).and_return(driver)
      allow(driver).to receive(:when_present).and_return(true)
      druid.has_expected_element?
    end

    it "should handle non-existent elements gracefully" do
      class FakePage
        include Druid
        expected_element :foo
      end
      expect(FakePage.new(driver)).not_to have_expected_element
    end
  end

  context "using element accessor" do
    class DefaultElementTagToElement
      include Druid
      # verify that the explicit :element tag can be omitted
      # element('button', :element, {:css => 'some css'})
      element('button', { :css => 'some css' })
      elements('button2', { :css => 'some css' })
    end

    let(:page) { DefaultElementTagToElement.new(driver) }

    def mock_driver_for(tag)
      expect(driver).to receive(tag).with(:css => 'some css').and_return(driver)
    end

    it "should default element tag to element" do
      mock_driver_for :element
      page.button_element
    end

    it "should default elements tag to element" do
      mock_driver_for :elements
      expect(driver).to receive(:map).and_return([])
      page.button2_elements.to_a
    end
  end

  describe "using default identifiers" do
    class DefaultIdentifier
      include Druid
      text_field(:default_tf)
      hidden_field(:default_hf)
      text_area(:default_ta)
      select_list(:default_sl)
      link(:default_link)
      checkbox(:default_cb)
      radio_button(:default_rb)
      button(:default_but)
      div(:default_div)
      span(:default_span)
      table(:default_tab)
      cell(:default_cell)
      image(:default_im)
      form(:default_form)
      list_item(:default_li)
      unordered_list(:default_ul)
      ordered_list(:default_ol)
      h1(:default_h1)
      h2(:default_h2)
      h3(:default_h3)
      h4(:default_h4)
      h5(:default_h5)
      h6(:default_h6)
      paragraph(:default_p)
      file_field(:default_ff)
      label(:default_lab)
      element(:default_el, :audio)
    end

    let(:default_identifier) { DefaultIdentifier.new(driver) }

    before(:each) do
      expect(driver).to receive(:exist?).and_return(true)
    end

    def mock_driver_for(tag)
      expect(driver).to receive(tag).with(:index => 0).and_return(driver)
    end

    it "should work with a text_field" do
      mock_driver_for :text_field
      default_identifier.default_tf?
    end

    it "should work with a hidden field" do
      mock_driver_for :hidden
      default_identifier.default_hf?
    end

    it "should work with a text area" do
      mock_driver_for :textarea
      default_identifier.default_ta?
    end

    it "should work with a select list" do
      mock_driver_for :select_list
      default_identifier.default_sl?
    end

    it "should work with a link" do
      mock_driver_for :link
      default_identifier.default_link?
    end

    it "should work with a checkbox" do
      mock_driver_for :checkbox
      default_identifier.default_cb?
    end

    it "should work with a radio button" do
      mock_driver_for :radio
      default_identifier.default_rb?
    end

    it "should work with a button" do
      mock_driver_for :button
      default_identifier.default_but?
    end

    it "should work with a div" do
      mock_driver_for :div
      default_identifier.default_div?
    end

    it "should work with a span" do
      mock_driver_for :span
      default_identifier.default_span?
    end

    it "should work with a table" do
      mock_driver_for :table
      default_identifier.default_tab?
    end

    it "should work with a cell" do
      mock_driver_for :td
      default_identifier.default_cell?
    end

    it "should work with an image" do
      mock_driver_for :image
      default_identifier.default_im?
    end

    it "should work with a form" do
      mock_driver_for :form
      default_identifier.default_form?
    end

    it "should work with a list item" do
      mock_driver_for :li
      default_identifier.default_li?
    end

    it "should work with unordered lists" do
      mock_driver_for :ul
      default_identifier.default_ul?
    end

    it "should work with ordered lists" do
      mock_driver_for :ol
      default_identifier.default_ol?
    end

    it "should work with h1" do
      mock_driver_for :h1
      default_identifier.default_h1?
    end

    it "should work with h2" do
      mock_driver_for :h2
      default_identifier.default_h2?
    end

    it "should work with h3" do
      mock_driver_for :h3
      default_identifier.default_h3?
    end

    it "should work with h4" do
      mock_driver_for :h4
      default_identifier.default_h4?
    end

    it "should work with h5" do
      mock_driver_for :h5
      default_identifier.default_h5?
    end

    it "should work with h6" do
      mock_driver_for :h6
      default_identifier.default_h6?
    end

    it "should work with paragraph" do
      mock_driver_for :p
      default_identifier.default_p?
    end

    it "should work with file_field" do
      mock_driver_for :file_field
      default_identifier.default_ff?
    end

    it "should work with a label" do
      mock_driver_for :label
      default_identifier.default_lab?
    end

    it "should work with an element" do
      mock_driver_for :audio
      default_identifier.default_el?
    end
  end

  describe "check_box accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :check_active
        expect(druid).to respond_to :uncheck_active
        expect(druid).to respond_to :active_checked?
        expect(druid).to respond_to :active_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.active_element).to eql "checkbox"
      end
    end

    context "implementation" do
      it "should check a check box element" do
        expect(driver).to receive_message_chain(:checkbox, :set)
        druid.check_active
      end

      it "should clear a check box element" do
        expect(driver).to receive_message_chain(:checkbox, :clear)
        druid.uncheck_active
      end

      it "should know if a check box element is selected" do
        expect(driver).to receive_message_chain(:checkbox, :set?).and_return(true)
        expect(druid.active_checked?).to be true
      end

      it "should retreive a check box element" do
        expect(driver).to receive(:checkbox)
        expect(druid.active_element).to be_instance_of Druid::Elements::CheckBox
      end
    end
  end

  describe "link accessors" do

    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:google_search)
        expect(druid).to respond_to(:google_search_element)
      end

      it "should call a block on the element method when present" do
        expect(block_druid.continue_element).to eql "link"
      end
    end

    context "implementation" do
      it "should select a link" do
        expect(driver).to receive_message_chain(:link, :click)
        druid.google_search
      end

      it "should retreive a link element" do
        expect(driver).to receive(:link)
        expect(druid.google_search_element).to be_instance_of Druid::Elements::Link
      end
    end
  end

  describe "select_list accessors" do

    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :state
        expect(druid).to respond_to :state=
        expect(druid).to respond_to :state_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.state_element).to eql "select_list"
      end
    end

    context "implementation" do
      it "should get the current item from a select list" do
        expect(driver).to receive(:select_list).and_return(driver)
        expect(driver).to receive(:selected_options).and_return [driver]
        expect(driver).to receive(:text).and_return('OH')
        expect(druid.state).to eql 'OH'
      end

      it "should set the current item fo a select list" do
        expect(driver).to receive(:select_list).and_return driver
        expect(driver).to receive(:select).with('OH')
        druid.state = 'OH'
      end

      it "should retreive a select list element" do
        expect(driver).to receive(:select_list)
        expect(druid.state_element).to be_instance_of Druid::Elements::SelectList
      end

      it "should return list of selection options" do
        option1 = double('option')
        option2 = double('option')
        expect(option1).to receive(:text).and_return("CA")
        expect(option2).to receive(:text).and_return('OH')
        select_element = double("select")
        expect(select_element).to receive(:options).twice.and_return([option1,option2])
        expect(druid).to receive(:state_element).and_return(select_element)
        expect(druid.state_options).to eql ["CA","OH"]
      end
    end
  end

  describe "text_field accessors" do

    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:first_name)
        expect(druid).to respond_to(:first_name=)
        expect(druid).to respond_to(:first_name_element)
        expect(druid).to respond_to(:first_name?)
      end

      it "should call a block on the element method when present" do
        expect(block_druid.first_name_element).to eql "text_field"
      end
    end

    context "implementation" do
      it "should get the text from the text field element" do
        expect(driver).to receive_message_chain(:text_field, :value).and_return('Kim')
        expect(druid.first_name).to eql 'Kim'
      end

      it "should set some text on a text field element" do
        expect(driver).to receive_message_chain(:text_field, :set).with('Kim')
        druid.first_name = 'Kim'
      end

      it "should retreive text field element" do
        expect(driver).to receive(:text_field)
        expect(druid.first_name_element).to be_instance_of Druid::Elements::TextField
      end
    end
  end

  describe "button accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :click_me
        expect(druid).to respond_to :click_me_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.click_me_element).to eql "button"
      end
    end

    context "implementation" do
      it "should select a button" do
        expect(driver).to receive_message_chain(:button, :click)
        druid.click_me
      end

      it "should retreive a button element" do
        expect(driver).to receive(:button)
        expect(druid.click_me_element).to be_instance_of Druid::Elements::Button
      end
    end
  end

  describe "radio accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :first_element
        expect(druid).to respond_to :select_first
        expect(druid).to respond_to :first_selected?
      end

      it "should call a block on the element method when present" do
        expect(block_druid.first_element).to eql "radio_button"
      end
    end

    context "implementation" do
      it "should select a radio button" do
        expect(driver).to receive_message_chain(:radio, :set)
        druid.select_first
      end

      it "should determine if a radio is selected" do
        expect(driver).to receive_message_chain(:radio, :set?).and_return(true)
        expect(druid.first_selected?).to be true
      end

      it "should retreive a radio button element" do
        expect(driver).to receive(:radio)
        expect(druid.first_element).to be_instance_of Druid::Elements::RadioButton
      end
    end
  end

  describe "div accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :message
        expect(druid).to respond_to :message_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.footer_element).to eql "div"
      end
    end

    context "implementation" do
      it "should retreive the text from a div" do
        expect(driver).to receive_message_chain(:div, :text).and_return("Message from div")
        expect(druid.message).to eql "Message from div"
      end

      it "should retreive a div element" do
        expect(driver).to receive(:div)
        expect(druid.message_element).to be_instance_of Druid::Elements::Div
      end
    end
  end

  describe "table accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :cart_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.cart_element).to eql "table"
      end
    end

    context "implementation" do
      it "should retrieve the table element from the page" do
        expect(driver).to receive(:table)
        expect(druid.cart_element).to be_instance_of Druid::Elements::Table
      end
    end
  end

  describe "table cell accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :total
        expect(druid).to respond_to :total_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.total_element).to eql "cell"
      end
    end

    context "implementation" do
      it "should retrieve the text from the cell" do
        expect(driver).to receive_message_chain(:td, :text).and_return("10.00")
        expect(druid.total).to eql "10.00"
      end

      it "should retrieve the cell element from the page" do
        expect(driver).to receive(:td)
        expect(druid.total_element).to be_instance_of Druid::Elements::TableCell
      end
    end
  end

  describe "span accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :alert_span
        expect(druid).to respond_to :alert_span_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.alert_span_element).to eql "span"
      end
    end

    context "implementation" do
      it "should retrieve the text from a span" do
        expect(driver).to receive_message_chain(:span, :text).and_return('Alert')
        expect(druid.alert_span).to eql 'Alert'
      end

      it "should retrieve the span element from the page" do
        expect(driver).to receive(:span)
        expect(druid.alert_span_element).to be_instance_of Druid::Elements::Span
      end
    end
  end

  describe "image accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :logo_element
        expect(druid).to respond_to :logo_loaded?
      end

      it "should call a block on the element method when present " do
        expect(block_druid.logo_element).to eql "image"
      end
    end

    context "implementation" do
      it "should retrieve the image element from the page" do
        expect(driver).to receive(:image)
        expect(druid.logo_element).to be_instance_of Druid::Elements::Image
      end
    end
  end

  describe "hidden field accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :social_security_number
        expect(druid).to respond_to :social_security_number_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.secret_element).to eql "hidden_field"
      end
    end

    context "implementation" do
      it "should get the text from a hidden field" do
        expect(driver).to receive_message_chain(:hidden, :value).and_return('value')
        expect(druid.social_security_number).to eql 'value'
      end

      it "should retrieve a hidden field element" do
        expect(driver).to receive(:hidden)
        expect(druid.social_security_number_element).to be_instance_of Druid::Elements::HiddenField
      end
    end
  end

  describe "form accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :login_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.login_element).to eql "form"
      end
    end

    context "implementation" do
      it "should retrieve the form element from the page" do
        expect(driver).to receive(:form)
        expect(druid.login_element).to be_instance_of Druid::Elements::Form
      end
    end
  end

  describe "text area accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :address
        expect(druid).to respond_to :address=
        expect(druid).to respond_to :address_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.address_element).to eql "text_area"
      end
    end

    context "implementation" do
      it "should set some text on the text area" do
        expect(driver).to receive_message_chain(:textarea, :set).with('123 main street')
        druid.address='123 main street'
      end

      it "should get the text from the text area" do
        expect(driver).to receive_message_chain(:textarea, :value).and_return('123 main street')
        expect(druid.address).to eql '123 main street'
      end

      it "should retrieve a text area element" do
        expect(driver).to receive(:textarea)
        expect(druid.address_element).to be_instance_of Druid::Elements::TextArea
      end
    end
  end

  describe "list item accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :item_one
        expect(druid).to respond_to :item_one_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.item_one_element).to eql "list_item"
      end
    end

    context "implementation" do
      it "should retrieve the text from the list item" do
        expect(driver).to receive_message_chain(:li, :text).and_return('value')
        expect(druid.item_one).to eql 'value'
      end

      it "should retrieve the list item element from the page" do
        expect(driver).to receive(:li)
        expect(druid.item_one_element).to be_instance_of Druid::Elements::ListItem
      end
    end
  end

  describe "unordered list accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :menu_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.menu_element).to eql "unordered_list"
      end
    end

    context "implementation" do
      it "should retrieve the element from the page" do
        expect(driver).to receive(:ul)
        expect(druid.menu_element).to be_instance_of Druid::Elements::UnOrderedList
      end
    end
  end

  describe "ordered list accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :top_five_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.top_five_element).to eql "ordered_list"
      end
    end

    context "implementation" do
      it "should retrieve the element from the page" do
        expect(driver).to receive(:ol)
        expect(druid.top_five_element).to be_instance_of Druid::Elements::OrderedList
      end
    end
  end

  describe "h1 accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :heading1
        expect(druid).to respond_to :heading1_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.heading1_element).to eql "h1"
      end
    end

    context "implementation" do
      it "should retrieve the text from the h1" do
        expect(driver).to receive(:h1).and_return(driver)
        expect(driver).to receive(:text).and_return("value")
        expect(druid.heading1).to eql "value"
      end

      it "should retrieve the element from the page" do
        expect(driver).to receive(:h1).and_return(driver)
        expect(druid.heading1_element).to be_instance_of Druid::Elements::Heading
      end
    end
  end

  describe "h2 accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:heading2)
        expect(druid).to respond_to(:heading2_element)
      end

      it "should call a block on the element method when present" do
        expect(block_druid.heading2_element).to eql "h2"
      end
    end

    context "implementation" do
      it "should retrieve the text from the h2" do
        expect(driver).to receive(:h2).and_return(driver)
        expect(driver).to receive(:text).and_return("value")
        expect(druid.heading2).to eql "value"
      end

      it "should retrieve the element from the page" do
        expect(driver).to receive(:h2).and_return(driver)
        expect(druid.heading2_element).to be_instance_of Druid::Elements::Heading
      end
    end
  end

  describe "h3 accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:heading3)
        expect(druid).to respond_to(:heading3_element)
      end

      it "should call a block on the element method when present" do
        expect(block_druid.heading3_element).to eql "h3"
      end
    end

    context "implementation" do
      it "should retrieve the text from the h3" do
        expect(driver).to receive(:h3).and_return(driver)
        expect(driver).to receive(:text).and_return("value")
        expect(druid.heading3).to eql "value"
      end

      it "should retrieve the element from the page" do
        expect(driver).to receive(:h3).and_return(driver)
        expect(druid.heading3_element).to be_instance_of Druid::Elements::Heading
      end
    end
  end

  describe "h4 accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:heading4)
        expect(druid).to respond_to(:heading4_element)
      end

      it "should call a block on the element method when present" do
        expect(block_druid.heading4_element).to eql "h4"
      end
    end

    context "implementation" do
      it "should retrieve the text from the h4" do
        expect(driver).to receive(:h4).and_return(driver)
        expect(driver).to receive(:text).and_return("value")
        expect(druid.heading4).to eql "value"
      end

      it "should retrieve the element from the page" do
        expect(driver).to receive(:h4).and_return(driver)
        expect(druid.heading4_element).to be_instance_of Druid::Elements::Heading
      end
    end
  end

  describe "h5 accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:heading5)
        expect(druid).to respond_to(:heading5_element)
      end

      it "should call a block on the element method present" do
        expect(block_druid.heading5_element).to eql "h5"
      end
    end

    context "implementation" do
      it "should retrieve the text from the h5" do
        expect(driver).to receive(:h5).and_return(driver)
        expect(driver).to receive(:text).and_return("value")
        expect(druid.heading5).to eql "value"
      end

      it "should retrieve the element from the page" do
        expect(driver).to receive(:h5).and_return(driver)
        expect(druid.heading5_element).to be_instance_of Druid::Elements::Heading
      end
    end
  end

  describe "h6 accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:heading6)
        expect(druid).to respond_to(:heading6_element)
      end

      it "should call a block on the element method present" do
        expect(block_druid.heading6_element).to eql "h6"
      end
    end

    context "implementation" do
      it "should retrieve the text from the h6" do
        expect(driver).to receive(:h6).and_return(driver)
        expect(driver).to receive(:text).and_return("value")
        expect(druid.heading6).to eql "value"
      end

      it "should retrieve the element from the page" do
        expect(driver).to receive(:h6).and_return(driver)
        expect(druid.heading6_element).to be_instance_of Druid::Elements::Heading
      end
    end
  end

  describe "paragraph accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:first_para)
        expect(druid).to respond_to(:first_para_element)
      end

      it "should call a block on the element method when present" do
        expect(block_druid.first_para_element).to eql "p"
      end
    end

    context "implementation" do
      it "should retrieve the text from the p" do
        expect(driver).to receive(:p).and_return(driver)
        expect(driver).to receive(:text).and_return("value")
        expect(druid.first_para).to eql "value"
      end

      it "should retrieve the element from the page" do
        expect(driver).to receive(:p).and_return(driver)
        expect(druid.first_para_element).to be_instance_of Druid::Elements::Paragraph
      end
    end
  end

  describe "file_field accessors" do
    context "when called on a page object" do
      it "should geneate accessor methods" do
        expect(druid).to respond_to(:upload_me=)
        expect(druid).to respond_to(:upload_me_element)
      end

      it "should call a block on the element method when present" do
        expect(block_druid.a_file_element).to eql "file_field"
      end
    end

    context "implementation" do
      it "should set the file name" do
        expect(driver).to receive(:file_field).and_return(driver)
        expect(driver).to receive(:set).with('some_file')
        druid.upload_me = 'some_file'
      end

      it "should retrieve a file field element" do
        expect(driver).to receive(:file_field).and_return(driver)
        expect(druid.upload_me_element).to be_instance_of Druid::Elements::FileField
      end
    end
  end

  describe "area accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:img_area)
        expect(druid).to respond_to(:img_area_element)
      end

      it "should call a block on the element method when present" do
        expect(block_druid.img_area_element).to eql "area"
      end
    end

    it "should click on the area" do
      expect(driver).to receive(:area).and_return(driver)
      expect(driver).to receive(:click)
      druid.img_area
    end

    it "should retrieve the element from the page" do
      expect(driver).to receive(:area).and_return(driver)
      element = druid.img_area_element
      expect(element).to be_instance_of Druid::Elements::Area
    end
  end

  describe "canvas accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:my_canvas_element)
      end

      it "should call a block on the element method when present" do
        expect(block_druid.my_canvas_element).to eql "canvas"
      end
    end
  end

  describe "audio accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:acdc_element)
      end

      it "should call a block on the element method when present" do
        expect(block_druid.acdc_element).to eql "audio"
      end
    end
  end

  describe "video accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:movie_element)
      end

      it "should call a block on the element method when present" do
        expect(block_druid.movie_element).to eql "video"
      end
    end
  end

  describe "b accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:bold)
        expect(druid).to respond_to(:bold_element)
        expect(druid).to respond_to(:bold?)
      end

      it "should call a block on the element method when present" do
        expect(block_druid.bold_element).to eql "b"
      end
    end

    it "should retrieve the text from the b" do
      expect(driver).to receive(:b).and_return(driver)
      expect(driver).to receive(:text).and_return("value")
      expect(druid.bold).to eql "value"
    end

    it "should retrieve the element from the page" do
      expect(driver).to receive(:b).and_return(driver)
      element = druid.bold_element
      expect(element).to be_instance_of Druid::Elements::Bold
    end
  end
end

describe "accessors" do
  let(:driver) { mock_driver }
  let(:page) { GenericPage.new driver}

  context '#wait_for_expected_title' do
    before(:each) do
      allow(driver).to receive(:wait_until).and_yield
    end

    it "true if already there" do
      allow(driver).to receive(:title).and_return 'expected title'
      expect(page.wait_for_expected_title?).to be_truthy
    end

    it "does not wait if it already is there" do
      allow(driver).to receive(:title).and_return 'expected title'
      expect(driver).to_not receive(:wait_until)
      expect(page.wait_for_expected_title?).to be_truthy
    end

    it "errors when it does not match" do
      allow(driver).to receive(:title).and_return 'wrong title'
      expect { page.wait_for_expected_title? }.to raise_error "Expected title 'expected title' instead of 'wrong title'"
    end

    it 'pick up when the title changes' do
      allow(driver).to receive(:title).and_return 'wrong title', 'expected title'
      expect(page.wait_for_expected_title?).to be_truthy
    end
  end
end
