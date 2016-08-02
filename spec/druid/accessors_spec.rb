require 'spec_helper'

class AccessorsTestDruid
  include Druid

  page_url "http://apple.com"
  link(:google_search, :link => 'Google Search')
  text_field(:first_name, :id => 'first_name')
  select_list(:state, :id => 'state')
  checkbox(:active, :id => 'is_active_id')
  button(:click_me, :id => 'button_submit')
  radio_button(:first, :id => 'first_choice')
  div(:message, :id => 'message_id')
  table(:cart, :id => 'cart_id')
  cell(:total, :id => 'total')
  span(:alert, :id => 'alert_id')
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
  span :alert do |element|
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
      page = AccessorsTestDruid.new(driver, true)
    end

    it "should not navigate to a page when not requested" do
      expect(driver).not_to receive(:goto)
      page = AccessorsTestDruid.new(driver)
    end

    it "should not navigate to a page when 'page_url' not specified" do
      expect(driver).not_to receive(:goto)
      page = TestDruidBackUp.new(driver,true)
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
        expect(driver).to receive_message_chain(:select_list, :value).and_return('OH')
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
    end
  end

  describe "text_field accessors" do

    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:first_name)
        expect(druid).to respond_to(:first_name=)
        expect(druid).to respond_to(:first_name_element)
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
        expect(druid).to respond_to :clear_first
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

      it "should clear a radio button" do
        expect(driver).to receive_message_chain(:radio, :clear)
        druid.clear_first
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
        expect(block_druid.total_cell).to eql "cell"
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
        expect(druid).to respond_to :alert
        expect(druid).to respond_to :alert_element
      end

      it "should call a block on the element method when present" do
        expect(block_druid.alert_element).to eql "span"
      end
    end

    context "implementation" do
      it "should retrieve the text from a span" do
        expect(driver).to receive_message_chain(:span, :text).and_return('Alert')
        expect(druid.alert).to eql 'Alert'
      end

      it "should retrieve the span element from the page" do
        expect(driver).to receive(:span)
        expect(druid.alert_element).to be_instance_of Druid::Elements::Span
      end
    end
  end

  describe "image accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :logo_element
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
        expect(driver).to receive_message_chain(:textarea, :send_keys).with('123 main street')
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
end
