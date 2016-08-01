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
    def in_frame(identifier, frame=nil, &block)
      frame = [] if frame.nil?
      frame << {frame: identifier}
      block.call(frame)
    end

    def in_iframe(identifier, frame=nil, &block)
      frame = [] if frame.nil?
      frame << {iframe: identifier}
      block.call(frame)
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
    def link(name, identifier=nil, &block)
      define_method(name) do
        return click_link_for identifier.clone unless block_given?
        self.send("#{name}_element").click
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        link_for(identifier.clone)
        # block ? call_block(&block) : link_for(identifier.clone)
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
    def text_field(name, identifier=nil, &block)
      define_method(name) do
        return text_field_value_for identifier.clone unless block_given?
        self.send("#{name}_element").value
      end
      define_method("#{name}=") do |value|
        return text_field_value_set(identifier.clone, value) unless block_given?
        self.send("#{name}_element").value = value
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        text_field_for(identifier.clone)
        # block ? call_block(&block) : text_field_for(identifier.clone)
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
    def checkbox(name, identifier=nil, &block)
      define_method("check_#{name}") do
        return check_checkbox identifier.clone unless block_given?
        self.send("#{name}_element").check
      end
      define_method("uncheck_#{name}") do
        return uncheck_checkbox identifier.clone unless block_given?
        self.send("#{name}_element").uncheck
      end
      define_method("#{name}_checked?") do
        return checkbox_checked? identifier.clone unless block_given?
        self.send("#{name}_element").checked?
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        checkbox_for(identifier.clone)
        # block ? call_block(&block) : checkbox_for(identifier.clone)
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
    def select_list(name, identifier=nil, &block)
      define_method(name) do
        return select_list_value_for identifier.clone unless block_given?
        self.send("#{name}_element").value
      end
      define_method("#{name}=") do |value|
        return select_list_value_set(identifier.clone, value) unless block_given?
        self.send("#{name}_element").select(value)
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        select_list_for(identifier.clone)
        # block ? call_block(&block) : select_list_for(identifier.clone)
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
    def radio_button(name, identifier=nil, &block)
      define_method("select_#{name}") do
        return select_radio identifier.clone unless block_given?
        self.send("#{name}_element").select
      end
      define_method("clear_#{name}") do
        return clear_radio identifier.clone unless block_given?
        self.send("#{name}_element").clear
      end
      define_method("#{name}_selected?") do
        return radio_selected? identifier.clone unless block_given?
        self.send("#{name}_element").selected?
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        radio_button_for(identifier.clone)
        # block ? call_block(&block) : radio_button_for(identifier.clone)
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
    def button(name, identifier=nil, &block)
      define_method(name) do
        return click_button_for identifier.clone unless block_given?
        self.send("#{name}_element").click
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        button_for(identifier.clone)
        # block ? call_block(&block) : button_for(identifier.clone)
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
    def div(name, identifier=nil, &block)
      define_method(name) do
        return div_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        div_for(identifier.clone)
        # block ? call_block(&block) : div_for(identifier.clone)
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
    def table(name, identifier=nil, &block)
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        table_for(identifier.clone)
        # block ? call_block(&block) : table_for(identifier.clone)
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
    def cell(name, identifier=nil, &block)
      define_method(name) do
        return cell_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        cell_for(identifier.clone)
        # block ? call_block(&block) : cell_for(identifier.clone)
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
    def span(name, identifier=nil, &block)
      define_method(name) do
        return span_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        span_for(identifier.clone)
        # block ? call_block(&block) : span_for(identifier.clone)
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
    def image(name, identifier=nil, &block)
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        image_for(identifier.clone)
        # block ? call_block(&block) : image_for(identifier.clone)
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
    def form(name, identifier=nil, &block)
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        form_for(identifier.clone)
        # block ? call_block(&block) : form_for(identifier.clone)
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
    def hidden_field(name, identifier=nil, &block)
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        hidden_field_for(identifier.clone)
        # block ? call_block(&block) : hidden_field_for(identifier.clone)
      end
      define_method(name) do
        return hidden_field_value_for identifier.clone unless block_given?
        self.send("#{name}_element").value
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
    def list_item(name, identifier=nil, &block)
      define_method(name) do
        return list_item_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        list_item_for(identifier.clone)
        # block ? call_block(&block) : list_item_for(identifier.clone)
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
    def ordered_list(name, identifier=nil, &block)
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        ordered_list_for(identifier.clone)
        # block ? call_block(&block) : ordered_list_for(identifier.clone)
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
    def text_area(name, identifier=nil, &block)
      define_method("#{name}=") do |value|
        return text_area_value_set(identifier.clone, value) unless block_given?
        self.send("#{name}_element").value = value
      end
      define_method(name) do
        return text_area_value_for identifier.clone unless block_given?
        self.send("#{name}_element").value
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        text_area_for(identifier.clone)
        # block ? call_block(&block) : text_area_for(identifier.clone)
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
    def unordered_list(name, identifier=nil, &block)
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        unordered_list_for(identifier.clone)
        # block ? call_block(&block) : unordered_list_for(identifier.clone)
      end
      alias_method "#{name}_unordered_list".to_sym, "#{name}_element".to_sym
    end

    #
    # adds a method to retrieve the text of a h1 and a h1 element
    #
    # @example
    #   h1(:title, :id => 'title')
    #   # will generate a 'title' and 'title_element' method
    #
    # @param [String] the name used for the generated methods
    # @param [Hash] identifier how we find a H1.  You can use a multiple paramaters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def h1(name, identifier=nil, &block)
      define_method(name) do
        return h1_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        h1_for(identifier.clone)
      end
      alias_method "#{name}_h1".to_sym, "#{name}_element".to_sym
    end
  end
end
