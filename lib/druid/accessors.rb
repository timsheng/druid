require 'druid/elements'
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
    # add three methods - one to select a link and another
    # to return a link element, and another one to select a link and not wait for the corresponding action to complete
    #
    # Example: link(:add_to_cart, :text => "Add to Cart")
    # will generate the 'add_to_cart' and 'add_to_cart_link', 'add_to_cart_no_wait'
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
      identifier = Elements::Link.identifier_for identifier
      define_method(name) do
        puts "#{name} method generated"
        driver.link(identifier).click
      end
      define_method("#{name}_link") do
        puts "#{name}_link method generated"
        element = driver.link(identifier)
        Druid::Elements::Link.new(element)
      end
      define_method("#{name}_no_wait") do
        puts "#{name}_no_wait method generated"
        driver.link(identifier).click_no_wait
      end
    end
    #
    # adds three methods to the page object - one to set text in a text field,
    # another to retrieve text from a text field and another to return the text
    # field element.
    #
    # Example:  text_field(:first_name, {:id => "first_name"})
    # will generate the 'first_name', 'first_name=' and 'first_name_text_field methods.
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
      identifier = Elements::TextField.identifier_for identifier
      define_method(name) do
        puts "#{name} method generated"
        driver.text_field(identifier).value
      end
      define_method("#{name}=") do |value|
        puts "#{name}= method generated"
        driver.text_field(identifier).set value
      end
      define_method("#{name}_text_field") do
        puts "#{name}_element method generated"
        element = driver.text_field(identifier)
        Druid::Elements::TextField.new(element)
      end
    end
    #
    # adds four methods - one to check, another to uncheck, another
    # to return the state of a checkbox, and a final method to return
    # a checkbox  element.
    #
    # Example: checkbox(:active, {:name => "is_active"})
    # will generate the 'check_active', 'uncheck_active',
    # 'active_checked?' and 'active_checkbox' methods.
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
      identifier = Elements::CheckBox.identifier_for identifier
      define_method("check_#{name}") do
        puts "check_#{name} method generated"
        driver.checkbox(identifier).set
      end
      define_method("uncheck_#{name}") do
        puts "uncheck_#{name} method generated"
        driver.checkbox(identifier).clear
      end
      define_method("#{name}_checked?") do
        puts "#{name}_checked? method generated"
        driver.checkbox(identifier).set?
      end
      define_method("#{name}_checkbox") do
        puts "#{name}_checkbox method generated"
        element = driver.checkbox(identifier)
        Druid::Elements::CheckBox.new(element)
      end
    end
    #
    # adds three methods - one to select an item in a drop-down,
    # another to fetch the currently selected item and another
    # to retrieve the select list element.
    #
    # Example:  select_list(:state, {:id => "state"})
    # will generate the 'state', 'state=' and 'state_select_list' methods
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
      identifier = Elements::SelectList.identifier_for identifier
      define_method(name) do
        puts "#{name} method generated"
        driver.select_list(identifier).value
      end
      define_method("#{name}=") do |value|
        puts "#{name}= method generated"
        driver.select_list(identifier).select value
      end
      define_method("#{name}_select_list") do
        puts "#{name}_select_list method generated"
        element = driver.select_list(identifier)
        Druid::Elements::SelectList.new(element)
      end
    end
    #
    # adds three methods - one to select
    # another to return if a radio button is selected, and
    # another method to return a radio_button element
    #
    # Example:  radio_button(:north, {:id => "north"})
    # will generate 'select_north'
    # 'north_selected?' and 'north_radio_button' methods
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
      identifier = Elements::RadioButton.identifier_for identifier
      define_method("select_#{name}") do
        puts "select_#{name} method generated"
        driver.radio(identifier).set
      end
      define_method("clear_#{name}") do
        puts "clear_#{name} method generated"
        driver.radio(identifier).clear
      end
      define_method("#{name}_selected?") do
        puts "#{name}_selected method generated"
        driver.radio(identifier).set?
      end
      define_method("#{name}_radio_button") do
        puts "#{name}_radio_button method generated"
        element = driver.radio(identifier)
        Druid::Elements::RadioButton.new(element)
      end
    end
    #
    # adds two methods - one to click a button and another to
    # return the button element.
    #
    # Example: button(:purchase, :id => 'purchase')
    # will generate a 'purchase' and 'purchase_button' methods.
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
      identifier = Elements::Button.identifier_for identifier
      define_method(name) do
        puts "#{name} method generated"
        driver.button(identifier).click
      end
      define_method("#{name}_button") do
        puts "#{name}_button method generated"
        element = driver.button(identifier)
        Druid::Elements::Button.new(element)
      end
    end
    #
    # adds two methods - one to retrieve the text from a div
    # and another to return the div element
    #
    # Example:  div(:message, {:id => 'message'})
    # will generate a 'message' and 'message_div' methods
    #
    # @param the name used for the generated methods
    # @param identifier how we find a div.  The valid values are:
    #   :class
    #   :id
    #   :index
    #   :xpath
    #   :name
    #
    def div(name, identifier)
      identifier = add_tagname_if_needed identifier, "div"
      identifier = Elements::Div.identifier_for identifier
      define_method(name) do
        puts "#{name} method generated"
        driver.div(identifier).text
      end
      define_method("#{name}_div") do
        puts "#{name}_div method generated"
        element = driver.div(identifier)
        Druid::Elements::Div.new(element)
      end
    end
    #
    # adds a method to retrieve the table element
    #
    # Example: table(:cart, :id => 'shopping_cart')
    # will generate a 'cart_table' method.
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
      identifier = add_tagname_if_needed identifier, "table"
      identifier = Elements::Table.identifier_for identifier
      define_method("#{name}_table") do
        puts "#{name}_table method generated"
        element = driver.table(identifier)
        Druid::Elements::Table.new(element)
      end
    end
    #
    # adds two methods  one to retrieve the text from a table cell
    # and another to return the table cell element
    #
    # Example: cell(:total, :id => 'total_cell')
    # will generate a 'total' and 'total_cell' methods
    #
    # @param the name used for the generated methods
    # @param identifier how we find a cell.  The valid values are:
    #   :class
    #   :id
    #   :index
    #   :xpath
    #   :name
    #
    def cell(name, identifier)
      identifier = add_tagname_if_needed identifier, "td"
      identifier = Elements::TableCell.identifier_for identifier
      define_method(name) do
        puts "#{name} method generated"
        driver.td(identifier).text
      end
      define_method("#{name}_cell") do
        puts "#{name}_cell method generated"
        element = driver.td(identifier)
        Druid::Elements::TableCell.new(element)
      end
    end
    #
    # adds two methods - one to retrieve the text from a span
    # and another to return the span element
    #
    # Example:  span(:alert, {:id => 'alert'})
    # will generate a 'alert' and 'alert_div' methods
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
      identifier = add_tagname_if_needed identifier, "span"
      identifier = Elements::Span.identifier_for identifier
      define_method(name) do
        puts "#{name} method generated"
        driver.span(identifier).text
      end
      define_method("#{name}_span") do
        puts "#{name}_span method generated"
        element = driver.span(identifier)
        Druid::Elements::Span.new(element)
      end
    end
    #
    # adds a method to retrieve the image element
    #
    # Example: image(:photo, :id => 'photo_id')
    # will generate a 'photo_image' method.
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
      identifier = Elements::Image.identifier_for identifier
      define_method("#{name}_image") do
        puts "#{name}_image method generated"
        element = driver.image(identifier)
        Druid::Elements::Image.new(element)
      end
    end
    #
    # adds a method to retrieve the form element
    #
    # @example
    #   form(:login, :id => 'login')
    #   # will generate a 'login_form' method
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
      identifier = Elements::Form.identifier_for identifier
      define_method("#{name}_form") do
        puts "#{name}_form method generated"
        element = driver.form(identifier)
        Druid::Elements::Form.new(element)
      end
    end
    #
    # adds two methods to the page object - one to get the text from a hidden field
    # and another to retrieve the hidden field element.
    #
    # @example
    #   hidden_field(:user_id, :id => "user_identity")
    #   # will generate 'user_id' and 'user_id_hidden_field' methods
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
      identifier = Elements::HiddenField.identifier_for identifier
      define_method("#{name}_hidden_field") do
        puts "#{name}_hidden_field method generated"
        element = driver.hidden(identifier)
        Druid::Elements::HiddenField.new(element)
      end
      define_method(name) do
        puts "#{name} method generated"
        driver.hidden(identifier).value
      end
    end
    #
    # adds two methods - one to retrieve the text from a list item
    # and another to return the list item element
    #
    # @example
    #   list_item(:item_one, :id => 'one')
    #   # will generate 'item_one' and 'item_one_list_item' methods
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
      identifier = add_tagname_if_needed identifier, "li"
      identifier = Elements::ListItem.identifier_for identifier
      define_method(name) do
        puts "#{name} method generated"
        driver.li(identifier).text
      end
      define_method("#{name}_list_item") do
        puts "#{name}_list_item method generated"
        driver.li(identifier)
      end
    end
    #
    # adds a method to retrieve the ordered list element
    #
    # @example
    #   ordered_list(:top_five, :id => 'top')
    #   # will generate a 'top_five_ordered_list' method
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
      identifier = add_tagname_if_needed identifier, "ol"
      identifier = Elements::OrderedList.identifier_for identifier
      define_method("#{name}_ordered_list") do
        puts "#{name}_ordered_list method generated"
        element = driver.ol(identifier)
        Druid::Elements::OrderedList.new(element)
      end
    end
    #
    # adds three methods to the page object - one to set text in a text area,
    # another to retrieve text from a text area and another to return the text
    # area element.
    #
    # @example
    #   text_area(:address, :id => "address")
    #   # will generate 'address', 'address=' and 'address_text_area methods
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
      identifier = Elements::TextArea.identifier_for identifier
      define_method("#{name}=") do |value|
        puts "#{name}= method generated"
        driver.textarea(identifier).send_keys value
      end
      define_method("#{name}") do
        puts "#{name} method generated"
        driver.textarea(identifier).value
      end
      define_method("#{name}_text_area") do
        puts "#{name}_text_area method generated"
        driver.textarea(identifier)
      end
    end
    #
    # adds a method to retrieve the unordered list element
    #
    # @example
    #   unordered_list(:menu, :id => 'main_menu')
    #   # will generate a 'menu_unordered_list' method
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
      identifier = add_tagname_if_needed identifier, "ul"
      identifier = Elements::UnOrderedList.identifier_for identifier
      define_method("#{name}_unordered_list") do
        puts "#{name}_unordered_list method generated"
        element = driver.ul(identifier)
        Druid::Elements::UnOrderedList.new(element)
      end
    end

    private

    def add_tagname_if_needed identifier, tag
      return identifier if identifier.length < 2 and not identifier[:name]
      identifier[:tag_name] = tag if identifier[:name]
      identifier
    end
  end

end
