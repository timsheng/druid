require 'druid/elements'
require 'erb'

module Druid
  #
  # Contains the class level methods that are inserted into your page class
  # when you include the PageObject module.  These methods will generate another
  # set of methods that provide access to the elements on the web pages.
  #
  module Accessors

    #
    # Set some values that can be used withing the class. This is
    # typically used to provided values that help build dynamic urls in
    # the page_url method
    #
    # @param [Hash] the value to set the params
    #
    def params=(the_params)
      @params = the_params
    end

    #
    # Return the params that exist on this page class
    #
    def params
      @params ||= {}
    end

    #
    # Specify the url for the page.  A call to this method will generate a
    # 'goto' method to take you to the page.
    #
    # @param [String] the url for the page.
    # @param [Symbol] a method name to call to get the url
    #
    def page_url(url)
      define_method("goto") do
        lookup = url.kind_of?(Symbol) ? self.send(url) : url
        erb = ERB.new(%Q{#{lookup}})
        merged_params = self.class.instance_variable_get("@merged_params")
        params = merged_params ? merged_params : self.class.params
        driver.goto erb.result(binding)
      end
    end
    alias_method :direct_url, :page_url

    #
    # Creates a method that compares the expected_title of a page against the actual.
    # @param [String] expected_title the literal expected title for the page
    # @param [Regexp] expected_title the expected title pattern for the page
    # @return [Boolean]
    # @raise An exception if expected_title does not match actual title
    #
    # @example Specify 'Google' as the expected title of a page
    #   expected_title "Google"
    #   page.has_expected_title?
    #
    def expected_title(expected_title)
      define_method("has_expected_title?") do
        has_expected_title = expected_title === title
        raise "Expected title '#{expected_title}' instead of '#{title}'" unless has_expected_title
        has_expected_title
      end
    end

    #
    # Creates a method that provides a way to initialize a page based upon an expected element
    # This is useful for pages that load dynamic content
    # @param [Symbol] the name given to the element in the declaration
    # @param [optional, Interger] timeout default value is 5 seconds
    # @return [boolean]
    #
    # @example Specify a text box named :address expected on the page within 10 seconds
    #   expected_element(:address, 10)
    #   page.has_expected_element?
    #
    def expected_element(element_name, timeout=5)
      define_method("has_expected_element?") do
        self.respond_to? "#{element_name}_element" and self.send("#{element_name}_element").when_present timeout
      end
    end

    #
    # Identify an element as existing within a frame or iframe. A frame parameter
    # is passed to the block and must be passed to the other calls to Druid.
    # You can nest calls to in_frame by passing the frame to the next level.
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
    # @param frame passed from a previous call to in_frame. Used to nest calls
    # @param block that contains the calls to elements that exist inside the frame.
    #
    def in_frame(identifier, frame=nil, &block)
      frame = [] if frame.nil?
      frame << {frame: identifier}
      block.call(frame)
    end
    #
    # Identify an element as existing within a frame or iframe. A frame parameter
    # is passed to the block and must be passed to the other calls to Druid.
    # You can nest calls to in_iframe by passing the frame to the next level.
    #
    # @example
    #  in_iframe(:id => 'frame_id') do |frame|
    #    text_field(:first_name, :id=> 'fname', :frame => frame)
    #  end
    #
    # @param [Hash] identifier how we find the frame. The valid keys are:
    #    * :id
    #    * :index
    #    * :name
    # @param frame passed from a previous call to in_iframe. Used to nest calls
    # @param block that contains the calls to elements that exist inside the frame.
    #
    def in_iframe(identifier, frame=nil, &block)
      frame = [] if frame.nil?
      frame << {iframe: identifier}
      block.call(frame)
    end

    #
    # adds three methods - one to select a link, another
    # to return a PageObject::Elements::Link object representing
    # the link, and another that checks the link's existence.
    #
    # @example
    #   link(:add_to_cart, :text => "Add to Cart")
    #   # will generate 'add_to_cart', 'add_to_cart_element', and 'add_to_cart?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a link. You can use a multiple parameters
    #   by combining of any of the following except xpath. The valid values are:
    #   * :class
    #   * :href
    #   * :id
    #   * :index
    #   * :name
    #   * :text
    #   * :xpath
    #   * :link
    #   * :link_text
    #   * :css
    #   * :title
    # @param optional block to be invoked when element method is called
    #
    def link(name, identifier={:index => 0}, &block)
      define_method(name) do
        return click_link_for identifier.clone unless block_given?
        self.send("#{name}_element").click
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        link_for(identifier.clone)
        # block ? call_block(&block) : link_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        link_for(identifier.clone).exist?
      end
      alias_method "#{name}_link".to_sym, "#{name}_element".to_sym
    end

    alias_method :a, :link


    #
    # adds four methods to the page objec - one to set text in a text field,
    # another to retrieve text from a text field, another to return the text
    # field element, another to check the text field's existence.
    #
    # @example
    #   text_field(:first_name, :id => "first_name")
    #   # will generate 'first_name', 'first_name=', 'first_name_element',
    #   # 'first_name?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a text_field. You can use a multiple parameters
    #   by combining of any of the following except xpath. The valid values are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :text
    #   * :title
    #   * :label
    # @param optional block to be invoked when element method is called
    #
    def text_field(name, identifier={:index => 0}, &block)
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
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        text_field_for(identifier.clone).exist?
      end
      alias_method "#{name}_text_field".to_sym, "#{name}_element".to_sym
    end

    #
    # adds five methods - one to check, another to uncheck, another
    # to return the state of a checkbox, another to return
    # a PageObject::Elements::CheckBox object representing the checkbox, and
    # a final method to check the checkbox's existence.
    #
    # @example
    #   checkbox(:active, :name => "is_active")
    #   # will generate 'check_active', 'uncheck_active', 'active_checked?',
    #   # 'active_element', and 'active?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a checkbox. You can use a multiple parameters
    #   by combining of any of the following except xpath.  The valid values are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :value
    # @param optional block to be invoked when element method is called
    #
    def checkbox(name, identifier={:index => 0}, &block)
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
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        checkbox_for(identifier.clone).exist?
      end
      alias_method "#{name}_checkbox".to_sym, "#{name}_element".to_sym
    end

    #
    # adds four methods - one to select an item in a drop-down,
    # another to fetch the currently selected item text, another
    # to retrieve the select list element, and another to check the
    # drop down's existence.
    #
    # @example
    #   select_list(:state, :id => "state")
    #   # will generate 'state', 'state=', 'state_element', 'state?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a select_list.  You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid values are:
    #   :class
    #   :id
    #   :index
    #   :name
    #   :xpath
    # @param optional block to be invoked when element method is called
    #
    def select_list(name, identifier={:index => 0}, &block)
      define_method(name) do
        return select_list_value_for identifier.clone unless block_given?
        self.send("#{name}_element").options.each {|o| return o.text if o.selected?}
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
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        select_list_for(identifier.clone).exist?
      end
      alias_method "#{name}_select_list".to_sym, "#{name}_element".to_sym
    end
    alias_method :select, :select_list

    #
    # adds five methods - one to select, another to clear,
    # another to return if a radio button is selected,
    # another method to return a PageObject::Elements::RadioButton
    # object representing the radio button element, and another to check
    # the radio button's existence.
    #
    # @example
    #   radio_button(:north, :id => "north")
    #   # will generate 'select_north', 'clear_north', 'north_selected?',
    #   # 'north_element', and 'north?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a radio_button. You can use a multiple parameters
    #   by combining of any of the following except xpath.  The valid values are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :value
    # @param optional block to be invoked when element method is called
    #
    def radio_button(name, identifier={:index => 0}, &block)
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
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        radio_button_for(identifier.clone).exist?
      end
      alias_method "#{name}_radio_button".to_sym, "#{name}_element".to_sym
    end
    alias_method :radio, :radio_button

    #
    # adds three methods - one to click a button, another to
    # return the button element, and another to check the button's existence.
    #
    # @example
    #   button(:purchase, :id => 'purchase')
    #   # will generate 'purchase', 'purchase_element', and 'purchase?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a button. You can use a multiple parameters
    #   by combining of any of the following except xpath. The valid values are:
    #   :class
    #   :id
    #   :index
    #   :name
    #   :text
    #   :xpath
    #   :src
    #   :alt
    #   :css
    # @param optional block to be invoked when element method is called
    #
    def button(name, identifier={:index => 0}, &block)
      define_method(name) do
        return click_button_for identifier.clone unless block_given?
        self.send("#{name}_element").click
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        button_for(identifier.clone)
        # block ? call_block(&block) : button_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        button_for(identifier.clone).exist?
      end
      alias_method "#{name}_button".to_sym, "#{name}_element".to_sym
    end

    #
    # adds three methods - one to retrieve the text from a div,
    # another to return the div element, and another to check the div's existence.
    #
    # @example
    #   div(:message, :id => 'message')
    #   # will generate 'message', 'message_element', and 'message?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a div. You can use a multiple parameters
    #   by combining of any of the following except xpath. The valid values are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #   * :text
    #   * :value
    #   * :title
    # @param optional block to be invoked when element method is called
    #
    def div(name, identifier={:index => 0}, &block)
      define_method(name) do
        return div_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        div_for(identifier.clone)
        # block ? call_block(&block) : div_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        div_for(identifier.clone).exist?
      end
      alias_method "#{name}_div".to_sym, "#{name}_element".to_sym
    end

    #
    # adds three methods - one to retrieve the text for the table, one
    # to retrieve the table element, and another to
    # check the table's existence.
    #
    # @example
    #   table(:cart, :id => 'shopping_cart')
    #   # will generate a 'cart', 'cart_element' and 'cart?' method
    #
    # @param the name used for the generated methods
    # @param identifier how we find a table. You can use a multiple parameters
    #   by combining of any of the following except xpath. The valid values are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    # @param optional block to be invoked when element method is called
    #
    def table(name, identifier={:index => 0}, &block)
      define_method(name) do
        return table_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        table_for(identifier.clone)
        # block ? call_block(&block) : table_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        table_for(identifier.clone).exist?
      end
      alias_method "#{name}_table".to_sym, "#{name}_element".to_sym
    end

    #
    # adds three methods - one to retrieve the text from a table cell,
    # another to return the table cell element, and another to check the cell's
    # existence.
    #
    # @example
    #   cell(:total, :id => 'total_cell')
    #   # will generate 'total', 'total_element', and 'total?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a cell. You can use a multiple parameters
    #   by combining of any of the following except xpath.  The valid values are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #   * :text
    # @param optional block to be invoked when element method is called
    #
    def cell(name, identifier={:index => 0}, &block)
      define_method(name) do
        return cell_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        cell_for(identifier.clone)
        # block ? call_block(&block) : cell_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        cell_for(identifier.clone).exist?
      end
      alias_method "#{name}_cell".to_sym, "#{name}_element".to_sym
    end
    alias_method :td, :cell

    #
    # adds three methods - one to retrieve the text from a span,
    # another to return the span element, and another to check the span's existence.
    #
    # @example
    #   span(:alert, :id => 'alert')
    #   # will generate 'alert', 'alert_element', and 'alert?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a span. You can use a multiple parameters
    #   by combining of any of the following except xpath.  The valid values are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #   * :text
    #   * :title
    # @param optional block to be invoked when element method is called
    #
    def span(name, identifier={:index => 0}, &block)
      define_method(name) do
        return span_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        span_for(identifier.clone)
        # block ? call_block(&block) : span_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        span_for(identifier.clone).exist?
      end
      alias_method "#{name}_span".to_sym, "#{name}_element".to_sym
    end

    #
    # adds two methods - one to retrieve the image element, and another to
    # check the image's existence.
    #
    # @example
    #   image(:logo, :id => 'logo')
    #   # will generate 'logo_element' and 'logo?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a image. You can use a multiple parameters
    #   by combining of any of the following except xpath. The valid values are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :alt
    #   * :src
    # @param optional block to be invoked when element method is called
    #
    def image(name, identifier={:index => 0}, &block)
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        image_for(identifier.clone)
        # block ? call_block(&block) : image_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        image_for(identifier.clone).exist?
      end
      alias_method "#{name}_image".to_sym, "#{name}_element".to_sym
    end
    alias_method :img, :image

    #
    # adds two methods - one to retrieve the form element, and another to
    # check the form's existence.
    #
    # @example
    #   form(:login, :id => 'login')
    #   # will generate 'login_element' and 'login?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a form. You can use a multiple parameters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #   * :action
    # @param optional block to be invoked when element method is called
    #
    def form(name, identifier={:index => 0}, &block)
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        form_for(identifier.clone)
        # block ? call_block(&block) : form_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        form_for(identifier.clone).exist?
      end
      alias_method "#{name}_form".to_sym, "#{name}_element".to_sym
    end

    #
    # adds three methods to the page object - one to get the text from a hidden field,
    # another to retrieve the hidden field element, and another to check the hidden
    # field's existence.
    #
    # @example
    #   hidden_field(:user_id, :id => "user_identity")
    #   # will generate 'user_id', 'user_id_element' and 'user_id?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a hidden field. You can use a multiple parameters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :text
    #   * :xpath
    #   * :value
    # @param optional block to be invoked when element method is called
    #
    def hidden_field(name, identifier={:index => 0}, &block)
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        hidden_field_for(identifier.clone)
        # block ? call_block(&block) : hidden_field_for(identifier.clone)
      end
      define_method(name) do
        return hidden_field_value_for identifier.clone unless block_given?
        self.send("#{name}_element").value
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        hidden_field_for(identifier.clone).exist?
      end
      alias_method "#{name}_hidden_field".to_sym, "#{name}_element".to_sym
    end
    alias_method :hidden, :hidden_field

    #
    # adds three methods - one to retrieve the text from a list item,
    # another to return the list item element, and another to check the list item's
    # existence.
    #
    # @example
    #   list_item(:item_one, :id => 'one')
    #   # will generate 'item_one', 'item_one_element', and 'item_one?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a list item. You can use a multiple parameters
    #   by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #   * :text
    # @param optional block to be invoked when element method is called
    #
    def list_item(name, identifier={:index => 0}, &block)
      define_method(name) do
        return list_item_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        list_item_for(identifier.clone)
        # block ? call_block(&block) : list_item_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        list_item_for(identifier.clone).exist?
      end
      alias_method "#{name}_list_item".to_sym, "#{name}_element".to_sym
    end
    alias_method :li, :list_item

    #
    # adds three methods - one to return the text within the ordered
    # list, one to retrieve the ordered list element, and another to
    # test it's existence.
    #
    # @example
    #   ordered_list(:top_five, :id => 'top')
    #   # will generate 'top_five' 'top_five_element' and 'top_five?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find an ordered list. You can use a multiple parameters
    #   by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    # @param optional block to be invoked when element method is called
    #
    def ordered_list(name, identifier={:index => 0}, &block)
      define_method(name) do
        return ordered_list_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        ordered_list_for(identifier.clone)
        # block ? call_block(&block) : ordered_list_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        ordered_list_for(identifier.clone).exist?
      end
      alias_method "#{name}_ordered_list".to_sym, "#{name}_element".to_sym
    end
    alias_method :ol, :ordered_list

    #
    # adds four methods to the page object - one to set text in a text area,
    # another to retrieve text from a text area, another to return the text
    # area element, and another to check the text area's existence.
    #
    # @example
    #   text_area(:address, :id => "address")
    #   # will generate 'address', 'address=', 'address_element',
    #   # 'address?' methods
    #
    # @param  [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a text area. You can use a multiple parameters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def text_area(name, identifier={:index => 0}, &block)
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
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        text_area_for(identifier.clone).exist?
      end
      alias_method "#{name}_text_area".to_sym, "#{name}_element".to_sym
    end
    alias_method :textarea, :text_area

    #
    # adds three methods - one to return the text of unordered list, another one
    # retrieve the unordered list element, and another to check it's existence.
    #
    # @example
    #   unordered_list(:menu, :id => 'main_menu')
    #   # will generate 'menu' 'menu_element' and 'menu?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find an unordered list. You can use a multiple parameters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    # @param optional block to be invoked when element method is called
    def unordered_list(name, identifier={:index => 0}, &block)
      define_method(name) do
        return unordered_list_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        unordered_list_for(identifier.clone)
        # block ? call_block(&block) : unordered_list_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        unordered_list_for(identifier.clone).exist?
      end
      alias_method "#{name}_unordered_list".to_sym, "#{name}_element".to_sym
    end
    alias_method :ul, :unordered_list

    #
    # adds three methods - one to retrieve the text of a h1 element, another to
    # retrieve a h1 element, and another to check for it's existence.
    #
    # @example
    #   h1(:title, :id => 'title')
    #   # will generate 'title', 'title_element', and 'title?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a H1.  You can use a multiple paramaters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def h1(name, identifier={:index => 0}, &block)
      define_method(name) do
        return h1_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        h1_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        h1_for(identifier.clone).exist?
      end
      alias_method "#{name}_h1".to_sym, "#{name}_element".to_sym
    end

    #
    # adds three methods - one to retrieve the text of a h2 element, another
    # to retrieve a h2 element, and another to check for it's existence.
    #
    # @example
    #   h2(:title, :id => 'title')
    #   # will generate 'title', 'title_element', and 'title?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a H2.  You can use a multiple paramaters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def h2(name, identifier={:index => 0}, &block)
      define_method(name) do
        return h2_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        h2_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        h2_for(identifier.clone).exist?
      end
      alias_method "#{name}_h2".to_sym, "#{name}_element".to_sym
    end

    #
    # adds three methods - one to retrieve the text of a h3 element,
    # another to return a h3 element, and another to check for it's existence.
    #
    # @example
    #   h3(:title, :id => 'title')
    #   # will generate 'title', 'title_element', and 'title?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a H3.  You can use a multiple paramaters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def h3(name, identifier={:index => 0}, &block)
      define_method(name) do
        return h3_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        h3_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        h3_for(identifier.clone).exist?
      end
      alias_method "#{name}_h3".to_sym, "#{name}_element".to_sym
    end

    #
    # adds three methods - one to retrieve the text of a h4 element,
    # another to return a h4 element, and another to check for it's existence.
    #
    # @example
    #   h4(:title, :id => 'title')
    #   # will generate 'title', 'title_element', and 'title?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a H4.  You can use a multiple paramaters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def h4(name, identifier={:index => 0}, &block)
      define_method(name) do
        return h4_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        h4_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        h4_for(identifier.clone).exist?
      end
      alias_method "#{name}_h4".to_sym, "#{name}_element".to_sym
    end

    #
    # adds three methods - one to retrieve the text of a h5 element,
    # another to return a h5 element, and another to check for it's existence.
    #
    # @example
    #   h5(:title, :id => 'title')
    #   # will generate 'title', 'title_element', and 'title?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a H5.  You can use a multiple paramaters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def h5(name, identifier={:index => 0}, &block)
      define_method(name) do
        return h5_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        h5_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        h5_for(identifier.clone).exist?
      end
      alias_method "#{name}_h5".to_sym, "#{name}_element".to_sym
    end

    #
    # adds three methods - one to retrieve the text of a h6 element,
    # another to return a h6 element, and another to check for it's existence.
    #
    # @example
    #   h6(:title, :id => 'title')
    #   # will generate 'title', 'title_element', and 'title?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a H6.  You can use a multiple paramaters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def h6(name, identifier={:index => 0}, &block)
      define_method(name) do
        return h6_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        h6_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        h6_for(identifier.clone).exist?
      end
      alias_method "#{name}_h6".to_sym, "#{name}_element".to_sym
    end

    #
    # adds three methods - one to retrieve the text of a paragraph, another
    # to retrieve a paragraph element, and another to check the paragraph's existence.
    #
    # @example
    #   paragraph(:title, :id => 'title')
    #   # will generate 'title', 'title_element', and 'title?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a paragraph.  You can use a multiple paramaters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def paragraph(name, identifier={:index => 0}, &block)
      define_method(name) do
        return paragraph_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        paragraph_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        paragraph_for(identifier.clone).exist?
      end
      alias_method "#{name}_paragraph".to_sym, "#{name}_element".to_sym
    end
    alias_method :p, :paragraph

    #
    # adds three methods - one to set the file for a file field, another to retrieve
    # the file field element, and another to check it's existence.
    #
    # @example
    #   file_field(:the_file, :id => 'file_to_upload')
    #   # will generate 'the_file=', 'the_file_element', and 'the_file?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a file_field.  You can use a multiple paramaters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :title
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def file_field(name, identifier={:index => 0}, &block)
      define_method("#{name}=") do |value|
        return file_field_value_set(identifier.clone, value) unless block_given?
        self.send("#{name}_element").value = value
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        file_field_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        file_field_for(identifier.clone).exist?
      end
    end

    #
    # adds three methods - one to retrieve the text from a label,
    # another to return the label element, and another to check the label's existence.
    #
    # @example
    #   label(:message, :id => 'message')
    #   # will generate 'message', 'message_element', and 'message?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a label. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #  * :class
    #  * :id
    #  * :index
    #  * :name
    #  * :text
    #  * :xpath
    # @param optional block to be invoked when element method is called
    #
    def label(name, identifier={:index => 0}, &block)
      define_method(name) do
        return label_text_for identifier.clone unless block_given?
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        label_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        label_for(identifier.clone).exist?
      end
      alias_method "#{name}_label".to_sym, "#{name}_element".to_sym
    end

    #
    # adds three methods - one to click the area,
    # another to return the area element, and another to check the area's existence.
    #
    # @example
    #   area(:message, :id => 'message')
    #   # will generate 'message', 'message_element', and 'message?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find an area. You can use a multiple parameters
    #   by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :text
    # @param optional block to be invoked when element method is called
    #
    def area(name, identifier={:index => 0}, &block)
      define_method(name) do
        return click_area_for identifier.clone unless block_given?
        self.send("#{name}_element").click
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        area_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        area_for(identifier.clone).exist?
      end
    end

    #
    # adds two method - one to return the canvas element and another to check
    # the canvas's existence.
    #
    # @example
    #   canvas(:my_canvas, :id => 'canvas_id')
    #   #  will generate 'my_canvas_element' and 'my_canvas?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a canvas. You can use a multiple parameters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def canvas(name, identifier={:index => 0}, &block)
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        canvas_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        canvas_for(identifier.clone).exist?
      end
    end

    #
    # adds two methods - one to return the audio element and another to check
    # the audio's existence
    #
    # @example
    #   audio(:acdc, :id => 'audio_id')
    #   # will generate 'acdc_element' and 'acdc?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find an audio element. You can use a multiple parameters
    #   by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def audio(name, identifier={:index => 0}, &block)
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        audio_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        audio_for(identifier.clone).exist?
      end
    end

    #
    # adds two methods - one to return the video element and another to check
    # the video's existence
    #
    # @example
    #   video(:movie, :id => 'video_id')
    #   # will generate 'movie_element' and 'movie?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find a video element. You can use a multiple parameters
    #   by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def video(name, identifier={:index => 0}, &block)
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        video_for(identifier.clone)
      end
      define_method("#{name}?") do
        return call_block(&block).exist? if block_given?
        video_for(identifier.clone).exist?
      end
    end

    #
    # adds three methods - one to retrieve the text an element, another
    # to retrieve an element, and another to check the element's existence.
    #
    # @example
    #   element(:titile, :id => 'title')
    #   # will generate 'title'm 'title_element', and 'title?' methods
    #
    # @param [Symbol] the name used for the generated methods
    # @param [Hash] identifier how we find an element. You can use a multiple parameters
    # by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    # @param optional block to be invoked when element method is called
    #
    def element(name, tag, identifier={:index => 0}, &block)
      define_method("#{name}") do
        self.send("#{name}_element").text
      end
      define_method("#{name}_element") do
        return call_block(&block) if block_given?
        element_for(tag, identifier.clone)
      end
      define_method("#{name}?") do
        self.send("#{name}_element").exist?
      end
    end

    [:text_fields,
     :hidden_fields,
     :text_areas,
     :select_lists,
     :links,
     :checkboxes,
     :radio_buttons,
     :buttons,
     :divs,
     :spans,
     :tables,
     :cells].each do |method_name|
      define_method(method_name) do |name, identifier, &block|
        define_method("#{name}_elements") do
          return call_block(&block) if block_given?
          self.send "#{method_name.to_s}_for", identifier.clone
        end
      end
    end

  end
end
