require 'druid/elements'
require 'druid/core_ext/string'
#
# Contains the class level methods that are inserted into your page class
# when you include the PageObject module.  These methods will generate another
# set of methods that provide access to the elements on the web pages.
#
module Druid
  module Accessors
    #
    # Specify the url for the page.  A call to this method will generate a
    # 'goto' method to take you to the page.
    #
    # @param [String] the url for the page.
    #
    def page_url(url)
      define_method("goto") do
        driver.goto url
      end
    end

    #
    # Identify an element as existing within a frame or iframe.
    #
    # @example
    #  in_frame(:id => 'frame_id') do |frame|
    #    text_field(:first_name, :id=> 'fname', :frame => frame)
    #  end
    #
    # @param [Hash] identifier how we find the frame. The valid keys are:
    #    * :id
    #    * :index
    #    * :name
    # @param block that contains the calls to elements that exist inside the frame.
    #
    def in_frame(identifier, &block)
      block.call([] << identifier)
    end
    #
    # add three methods - one to select a link and another
    # to return a link element, and another one to select a link and not wait for the corresponding action to complete
    #
    # Example: link(:add_to_cart, :text => "Add to Cart")
    # will generate the 'add_to_cart' and 'add_to_cart_element', 'add_to_cart_no_wait'
    # methods.
    #
    # @param the name used for the generated methods
    # @param identifier how we find a link. The valid values are:
    #   :class
    #   :href
    #   :id
    #   :index
    #   :name
    #   :text
    #   :xpath
    #   :link
    #   :link_text
    def link(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Link)
      define_method(name) do
        driver.instance_eval "#{nested_frames(frame_identifiers)}link(identifier).click"
      end
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}link(identifier)"
        Druid::Elements::Link.new(element)
      end
      define_method("#{name}_no_wait") do
        driver.instance_eval "#{nested_frames(frame_identifiers)}link(identifier).click_no_wait"
      end
      alias_method "#{name}_link".to_sym, "#{name}_element".to_sym
    end
    #
    # adds three methods to the page object - one to set text in a text field,
    # another to retrieve text from a text field and another to return the text
    # field element.
    #
    # Example:  text_field(:first_name, {:id => "first_name"})
    # will generate the 'first_name', 'first_name=' and 'first_name_element methods.
    #
    # @param  the name used for the generated methods
    # @param identifier how we find a text_field.  The valid values are:
    #   :class
    #   :css
    #   :id
    #   :index
    #   :name
    #   :tag_name
    #   :xpath
    def text_field(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextField)
      define_method(name) do
        driver.instance_eval "#{nested_frames(frame_identifiers)}text_field(identifier).value"
      end
      define_method("#{name}=") do |value|
        driver.instance_eval "#{nested_frames(frame_identifiers)}text_field(identifier).set(value)"
      end
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}text_field(identifier)"
        Druid::Elements::TextField.new(element)
      end
      alias_method "#{name}_text_field".to_sym, "#{name}_element".to_sym
    end
    #
    # adds four methods - one to check, another to uncheck, another
    # to return the state of a checkbox, and a final method to return
    # a checkbox  element.
    #
    # Example: checkbox(:active, {:name => "is_active"})
    # will generate the 'check_active', 'uncheck_active',
    # 'active_checked?' and 'active_element' methods.
    #
    # @param the name used for the generated methods
    # @param identifier how we find a checkbox.  The valid values are:
    #   :class
    #   :id
    #   :index
    #   :name
    #   :xpath
    #
    def checkbox(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::CheckBox)
      define_method("check_#{name}") do
        driver.instance_eval "#{nested_frames(frame_identifiers)}checkbox(identifier).set"
      end
      define_method("uncheck_#{name}") do
        driver.instance_eval "#{nested_frames(frame_identifiers)}checkbox(identifier).clear"
      end
      define_method("#{name}_checked?") do
        driver.instance_eval "checkbox(identifier).set?"
      end
      define_method("#{name}_element") do
        element = driver.instance_eval "checkbox(identifier)"
        Druid::Elements::CheckBox.new(element)
      end
      alias_method "#{name}_checkbox".to_sym, "#{name}_element".to_sym
    end
    #
    # adds three methods - one to select an item in a drop-down,
    # another to fetch the currently selected item and another
    # to retrieve the select list element.
    #
    # Example:  select_list(:state, {:id => "state"})
    # will generate the 'state', 'state=' and 'state_element' methods
    #
    # @param the name used for the generated methods
    # @param identifier how we find a select_list.  The valid values are:
    #   :class
    #   :id
    #   :index
    #   :name
    #   :xpath
    #
    def select_list(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::SelectList)
      define_method(name) do
        driver.instance_eval "#{nested_frames(frame_identifiers)}select_list(identifier).value"
      end
      define_method("#{name}=") do |value|
        driver.instance_eval "select_list(identifier).select value"
      end
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}select_list(identifier)"
        Druid::Elements::SelectList.new(element)
      end
      alias_method "#{name}_select_list".to_sym, "#{name}_element".to_sym
    end
    #
    # adds three methods - one to select
    # another to return if a radio button is selected, and
    # another method to return a radio_button element
    #
    # Example:  radio_button(:north, {:id => "north"})
    # will generate 'select_north'
    # 'north_selected?' and 'north_element' methods
    #
    # @param the name used for the generated methods
    # @param identifier how we find a radio_button.  The valid values are:
    #   :class
    #   :id
    #   :index
    #   :name
    #   :xpath
    #
    def radio_button(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::RadioButton)
      define_method("select_#{name}") do
        driver.instance_eval "#{nested_frames(frame_identifiers)}radio(identifier).set"
      end
      define_method("clear_#{name}") do
        driver.instance_eval "#{nested_frames(frame_identifiers)}radio(identifier).clear"
      end
      define_method("#{name}_selected?") do
        driver.instance_eval "#{nested_frames(frame_identifiers)}radio(identifier).set?"
      end
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}radio(identifier)"
        Druid::Elements::RadioButton.new(element)
      end
      alias_method "#{name}_radio_button".to_sym, "#{name}_element".to_sym
    end
    #
    # adds two methods - one to click a button and another to
    # return the button element.
    #
    # Example: button(:purchase, :id => 'purchase')
    # will generate a 'purchase' and 'purchase_element' methods.
    #
    # @param the name used for the generated methods
    # @param identifier how we find a button.  The valid values are:
    #   :class
    #   :id
    #   :index
    #   :name
    #   :text
    #   :xpath
    #
    def button(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Button)
      define_method(name) do
        driver.instance_eval "#{nested_frames(frame_identifiers)}button(identifier).click"
      end
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}button(identifier)"
        Druid::Elements::Button.new(element)
      end
      alias_method "#{name}_button".to_sym, "#{name}_element".to_sym
    end
    #
    # adds two methods - one to retrieve the text from a div
    # and another to return the div element
    #
    # Example:  div(:message, {:id => 'message'})
    # will generate a 'message' and 'message_element' methods
    #
    # @param the name used for the generated methods
    # @param identifier how we find a div.  The valid values are:
    #   :class
    #   :id
    #   :index
    #   :xpath
    #   :name
    #   :text
    #
    def div(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Div, 'div')
      define_method(name) do
        driver.instance_eval "#{nested_frames(frame_identifiers)}div(identifier).text"
      end
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}div(identifier)"
        Druid::Elements::Div.new(element)
      end
      alias_method "#{name}_div".to_sym, "#{name}_element".to_sym
    end
    #
    # adds a method to retrieve the table element
    #
    # Example: table(:cart, :id => 'shopping_cart')
    # will generate a 'cart_element' method.
    #
    # @param the name used for the generated methods
    # @param identifier how we find a table.  The valid values are:
    #   :class
    #   :id
    #   :index
    #   :xpath
    #   :name
    #
    def table(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Table, 'table')
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}table(identifier)"
        Druid::Elements::Table.new(element)
      end
      alias_method "#{name}_table".to_sym, "#{name}_element".to_sym
    end
    #
    # adds two methods  one to retrieve the text from a table cell
    # and another to return the table cell element
    #
    # Example: cell(:total, :id => 'total_cell')
    # will generate a 'total' and 'total_element' methods
    #
    # @param the name used for the generated methods
    # @param identifier how we find a cell.  The valid values are:
    #   :class
    #   :id
    #   :index
    #   :xpath
    #   :name
    #   :text
    #
    def cell(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TableCell, 'td')
      define_method(name) do
        driver.instance_eval "#{nested_frames(frame_identifiers)}td(identifier).text"
      end
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}td(identifier)"
        Druid::Elements::TableCell.new(element)
      end
      alias_method "#{name}_cell".to_sym, "#{name}_element".to_sym
    end
    #
    # adds two methods - one to retrieve the text from a span
    # and another to return the span element
    #
    # Example:  span(:alert, {:id => 'alert'})
    # will generate a 'alert' and 'alert_element' methods
    #
    # @param the name used for the generated methods
    # @param identifier how we find a span.  The valid values are:
    #   :class
    #   :id
    #   :index
    #   :xpath
    #   :name
    #
    def span(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Span, 'span')
      define_method(name) do
        driver.instance_eval "#{nested_frames(frame_identifiers)}span(identifier).text"
      end
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}span(identifier)"
        Druid::Elements::Span.new(element)
      end
      alias_method "#{name}_span".to_sym, "#{name}_element".to_sym
    end
    #
    # adds a method to retrieve the image element
    #
    # Example: image(:photo, :id => 'photo_id')
    # will generate a 'photo_element' method.
    #
    # @param the name used for the generated methods
    # @param identifier how we find a image.  The valid values are:
    #   :class
    #   :id
    #   :index
    #   :name
    #   :xpath
    #
    def image(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Image)
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}image(identifier)"
        Druid::Elements::Image.new(element)
      end
      alias_method "#{name}_image".to_sym, "#{name}_element".to_sym
    end
    #
    # adds a method to retrieve the form element
    #
    # @example
    #   form(:login, :id => 'login')
    #   # will generate a 'login_element' method
    #
    # @param [String] the name used for the generated methods
    # @param [Hash] identifier how we find a form.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def form(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Form)
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}form(identifier)"
        Druid::Elements::Form.new(element)
      end
      alias_method "#{name}_form".to_sym, "#{name}_element".to_sym
    end
    #
    # adds two methods to the page object - one to get the text from a hidden field
    # and another to retrieve the hidden field element.
    #
    # @example
    #   hidden_field(:user_id, :id => "user_identity")
    #   # will generate 'user_id' and 'user_id_element' methods
    #
    # @param [String] the name used for the generated methods
    # @param [Hash] identifier how we find a hidden field.  The valid keys are:
    #   * :class
    #   * :css
    #   * :id
    #   * :index
    #   * :name
    #   * :tag_name
    #   * :text
    #   * :xpath
    #
    def hidden_field(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::HiddenField)
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}hidden(identifier)"
        Druid::Elements::HiddenField.new(element)
      end
      define_method(name) do
        driver.instance_eval "#{nested_frames(frame_identifiers)}hidden(identifier).value"
      end
      alias_method "#{name}_hidden_field".to_sym, "#{name}_element".to_sym
    end
    #
    # adds two methods - one to retrieve the text from a list item
    # and another to return the list item element
    #
    # @example
    #   list_item(:item_one, :id => 'one')
    #   # will generate 'item_one' and 'item_one_element' methods
    #
    # @param [String] the name used for the generated methods
    # @param [Hash] identifier how we find a list item.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def list_item(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::ListItem, 'li')
      define_method(name) do
        driver.instance_eval "#{nested_frames(frame_identifiers)}li(identifier).text"
      end
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}li(identifier)"
        Druid::Elements::ListItem.new(element)
      end
      alias_method "#{name}_list_item".to_sym, "#{name}_element".to_sym
    end
    #
    # adds a method to retrieve the ordered list element
    #
    # @example
    #   ordered_list(:top_five, :id => 'top')
    #   # will generate a 'top_five_element' method
    #
    # @param [String] the name used for the generated methods
    # @param [Hash] identifier how we find an ordered list.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def ordered_list(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::OrderedList, 'ol')
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}ol(identifier)"
        Druid::Elements::OrderedList.new(element)
      end
      alias_method "#{name}_ordered_list".to_sym, "#{name}_element".to_sym
    end
    #
    # adds three methods to the page object - one to set text in a text area,
    # another to retrieve text from a text area and another to return the text
    # area element.
    #
    # @example
    #   text_area(:address, :id => "address")
    #   # will generate 'address', 'address=' and 'address_element' methods
    #
    # @param  [String] the name used for the generated methods
    # @param [Hash] identifier how we find a text area.  The valid keys are:
    #   * :class
    #   * :css
    #   * :id
    #   * :index
    #   * :name
    #   * :tag_name
    #   * :xpath
    #
    def text_area(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextArea)
      define_method("#{name}=") do |value|
        driver.instance_eval "#{nested_frames(frame_identifiers)}textarea(identifier).send_keys value"
      end
      define_method("#{name}") do
        driver.instance_eval "#{nested_frames(frame_identifiers)}textarea(identifier).value"
      end
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}textarea(identifier)"
        Druid::Elements::TextArea.new(element)
      end
      alias_method "#{name}_text_area".to_sym, "#{name}_element".to_sym
    end
    #
    # adds a method to retrieve the unordered list element
    #
    # @example
    #   unordered_list(:menu, :id => 'main_menu')
    #   # will generate a 'menu_element' method
    #
    # @param [String] the name used for the generated methods
    # @param [Hash] identifier how we find an unordered list.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def unordered_list(name, identifier)
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::UnOrderedList, 'ul')
      define_method("#{name}_element") do
        element = driver.instance_eval "#{nested_frames(frame_identifiers)}ul(identifier)"
        Druid::Elements::UnOrderedList.new(element)
      end
      alias_method "#{name}_unordered_list".to_sym, "#{name}_element".to_sym
    end

    private

    def add_tagname_if_needed identifier, tag
      return identifier if identifier.length < 2 and not identifier[:name]
      identifier[:tag_name] = tag if identifier[:name]
      identifier
    end

    def parse_identifiers(identifier, element, tag_name=nil)
      frame_identifiers = identifier.delete(:frame)
      identifier = add_tagname_if_needed identifier, tag_name if tag_name
      identifier = element.identifier_for identifier
      return identifier, frame_identifiers
    end

  end
end
