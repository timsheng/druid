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
      define_method(name) do
        click_link_for identifier
      end
      define_method("#{name}_element") do
        link_for identifier
      end
      define_method("#{name}_no_wait") do
        click_no_wait_link_for identifier
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
    def text_field name, identifier
      define_method(name) do
        text_field_value_for identifier
      end
      define_method("#{name}=") do |value|
        text_field_value_set identifier, value
      end
      define_method("#{name}_element") do
        text_field_for identifier
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
    def checkbox name, identifier
      define_method("check_#{name}") do
        check_checkbox identifier
      end
      define_method("uncheck_#{name}") do
        uncheck_checkbox identifier
      end
      define_method("#{name}_checked?") do
        checkbox_checked? identifier
      end
      define_method("#{name}_element") do
        checkbox_for identifier
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
      define_method(name) do
        select_list_value_for identifier
      end
      define_method("#{name}=") do |value|
        select_list_value_set identifier, value
      end
      define_method("#{name}_element") do
        select_list_for identifier
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
      define_method("select_#{name}") do
        select_radio identifier
      end
      define_method("clear_#{name}") do
        clear_radio identifier
      end
      define_method("#{name}_selected?") do
        radio_selected? identifier
      end
      define_method("#{name}_element") do
        radio_button_for identifier
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
      define_method(name) do
        click_button_for identifier
      end
      define_method("#{name}_element") do
        button_for identifier
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
    #   :value
    #
    def div(name, identifier)
      define_method(name) do
        div_text_for identifier
      end
      define_method("#{name}_element") do
        div_for identifier
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
      define_method("#{name}_element") do
        table_for identifier
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
      define_method(name) do
        cell_text_for identifier
      end
      define_method("#{name}_element") do
        cell_for identifier
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
    #   :text
    #
    def span(name, identifier)
      define_method(name) do
        span_text_for identifier
      end
      define_method("#{name}_element") do
        span_for identifier
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
      define_method("#{name}_element") do
        image_for identifier
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
      define_method("#{name}_element") do
        form_for identifier
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
      define_method("#{name}_element") do
        hidden_field_for identifier
      end
      define_method(name) do
        hidden_field_value_for identifier
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
      define_method(name) do
        list_item_text_for identifier
      end
      define_method("#{name}_element") do
        list_item_for identifier
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
      define_method("#{name}_element") do
        ordered_list_for identifier
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
      define_method("#{name}=") do |value|
        text_area_value_set identifier, value
      end
      define_method("#{name}") do
        text_area_value_for identifier
      end
      define_method("#{name}_element") do
        text_area_for identifier
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
      define_method("#{name}_element") do
        unordered_list_for identifier
      end
      alias_method "#{name}_unordered_list".to_sym, "#{name}_element".to_sym
    end



  end
end
