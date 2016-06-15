require 'spec_helper'

class TestDruid
  include Druid

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
end

describe Druid::Accessors do
  let(:driver) { mock_driver }
  let(:druid) { TestDruid.new(driver) }

  describe "check_box accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :check_active
        expect(druid).to respond_to :uncheck_active
        expect(druid).to respond_to :active_checked?
        expect(druid).to respond_to :active_checkbox
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
        expect(druid.active_checkbox).to be_instance_of Druid::Elements::CheckBox
      end
    end
  end

  describe "link accessors" do

    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:google_search)
        expect(druid).to respond_to(:google_search_no_wait)
        expect(druid).to respond_to(:google_search_link)
      end
    end

    context "implementation" do
      it "should select a link" do
        expect(driver).to receive_message_chain(:link, :click)
        druid.google_search
      end

      it "should select a link and not wait" do
        expect(driver).to receive_message_chain(:link, :click_no_wait)
        druid.google_search_no_wait
      end

      it "should retreive a link element" do
        expect(driver).to receive(:link)
        expect(druid.google_search_link).to be_instance_of Druid::Elements::Link
      end
    end
  end

  describe "select_list accessors" do

    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :state
        expect(druid).to respond_to :state=
        expect(druid).to respond_to :state_select_list
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
        expect(druid.state_select_list).to be_instance_of Druid::Elements::SelectList
      end
    end
  end

  describe "text_field accessors" do

    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to(:first_name)
        expect(druid).to respond_to(:first_name=)
        expect(druid).to respond_to(:first_name_text_field)
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
        expect(druid.first_name_text_field).to be_instance_of Druid::Elements::TextField
      end
    end
  end

  describe "button accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :click_me
        expect(druid).to respond_to :click_me_button
      end
    end

    context "implementation" do
      it "should select a button" do
        expect(driver).to receive_message_chain(:button, :click)
        druid.click_me
      end

      it "should retreive a button element" do
        expect(driver).to receive(:button)
        expect(druid.click_me_button).to be_instance_of Druid::Elements::Button
      end
    end
  end

  describe "radio accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :first_radio_button
        expect(druid).to respond_to :select_first
        expect(druid).to respond_to :first_selected?
        expect(druid).to respond_to :clear_first
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
        expect(druid.first_radio_button).to be_instance_of Druid::Elements::RadioButton
      end
    end
  end

  describe "div accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :message
        expect(druid).to respond_to :message_div
      end
    end

    context "implementation" do
      it "should retreive the text from a div" do
        expect(driver).to receive_message_chain(:div, :text).and_return("Message from div")
        expect(druid.message).to eql "Message from div"
      end

      it "should retreive a div element" do
        expect(driver).to receive(:div)
        expect(druid.message_div).to be_instance_of Druid::Elements::Div
      end
    end
  end

  describe "table accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :cart_table
      end
    end

    context "implementation" do
      it "should retrieve the table element from the page" do
        expect(driver).to receive(:table)
        expect(druid.cart_table).to be_instance_of Druid::Elements::Table
      end
    end
  end

  describe "table cell accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :total
        expect(druid).to respond_to :total_cell
      end
    end

    context "implementation" do
      it "should retrieve the text from the cell" do
        expect(driver).to receive_message_chain(:td, :text).and_return("10.00")
        expect(druid.total).to eql "10.00"
      end

      it "should retrieve the cell element from the page" do
        expect(driver).to receive(:td)
        expect(druid.total_cell).to be_instance_of Druid::Elements::TableCell
      end
    end
  end

  describe "span accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :alert
        expect(druid).to respond_to :alert_span
      end
    end

    context "implementation" do
      it "should retrieve the text from a span" do
        expect(driver).to receive_message_chain(:span, :text).and_return('Alert')
        expect(druid.alert).to eql 'Alert'
      end

      it "should retrieve the span element from the page" do
        expect(driver).to receive(:span)
        expect(druid.alert_span).to be_instance_of Druid::Elements::Span
      end
    end
  end

  describe "image accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :logo_image
      end
    end

    context "implementation" do
      it "should retrieve the image element from the page" do
        expect(driver).to receive(:image)
        expect(druid.logo_image).to be_instance_of Druid::Elements::Image
      end
    end
  end

  describe "hidden field accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :social_security_number
        expect(druid).to respond_to :social_security_number_hidden_field
      end
    end

    context "implementation" do
      it "should get the text from a hidden field" do
        expect(driver).to receive_message_chain(:hidden, :value).and_return('value')
        expect(druid.social_security_number).to eql 'value'
      end

      it "should retrieve a hidden field element" do
        expect(driver).to receive(:hidden)
        expect(druid.social_security_number_hidden_field).to be_instance_of Druid::Elements::HiddenField
      end
    end
  end

  describe "form accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :login_form
      end
    end

    context "implementation" do
      it "should retrieve the form element from the page" do
        expect(driver).to receive(:form)
        expect(druid.login_form).to be_instance_of Druid::Elements::Form
      end
    end
  end

  describe "text area accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :address
        expect(druid).to respond_to :address=
        expect(druid).to respond_to :address_text_area
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
        expect(druid.address_text_area).to be_instance_of Druid::Elements::TextArea
      end
    end
  end

  describe "list item accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :item_one
        expect(druid).to respond_to :item_one_list_item
      end
    end

    context "implementation" do
      it "should retrieve the text from the list item" do
        expect(driver).to receive_message_chain(:li, :text).and_return('value')
        expect(druid.item_one).to eql 'value'
      end

      it "should retrieve the list item element from the page" do
        expect(driver).to receive(:li)
        expect(druid.item_one_list_item).to be_instance_of Druid::Elements::ListItem
      end
    end
  end

  describe "unordered list accessors" do
    context "when called on a page object" do
      it "should generate accessor methods" do
        expect(druid).to respond_to :menu_unordered_list
      end
    end

    context "implementation" do
      it "should retrieve the element from the page" do
        expect(driver).to receive(:ul)
        expect(druid.menu_unordered_list).to be_instance_of Druid::Elements::UnOrderedList
      end
    end
  end
end
