
#
# Contains the class level methods that are inserted into your page class
# when you include the PageObject module.  These methods will generate another
# set of methods that provide access to the elements on the web pages.
#
module Druid
  module Accessors
    #
    # add two methods - one to select a link and another
    # to return a link element
    #
    # Example: link(:add_to_cart, :text => "Add to Cart")
    # will generate the 'add_to_cart' and 'add_to_cart_link'
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
    def link(name, identifier)
      define_method(name) do
        puts "#{name} method generated"
        driver.link(identifier).click
      end
      define_method("#{name}_link") do
        puts "#{name}_link method generated"
        driver.link(identifier)
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
        driver.text_field(identifier)
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
        driver.checkbox(identifier)
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
        driver.select_list(identifier)
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
      define_method("select_#{name}") do
        puts "select_#{name} method generated"
        driver.radio(identifier).set
      end
      define_method("#{name}_selected?") do
        puts "#{name}_selected method generated"
        driver.radio(identifier).set?
      end
      define_method("#{name}_radio_button") do
        puts "#{name}_radio_button method generated"
        driver.radio(identifier)
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
      define_method(name) do
        puts "#{name} method generated"
        driver.button(identifier).click
      end
      define_method("#{name}_button") do
        puts "#{name}_button method generated"
        driver.button(identifier)
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
    #
    def div(name, identifier)
      define_method(name) do
        puts "#{name} method generated"
        driver.div(identifier).text
      end
      define_method("#{name}_div") do
        puts "#{name}_div method generated"
        driver.div(identifier)
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
    #
    def table(name, identifier)
      define_method("#{name}_table") do
        puts "#{name}_table method generated"
        driver.table(identifier)
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
    #
    def cell(name, identifier)
      define_method(name) do
        puts "#{name} method generated"
        driver.td(identifier).text
      end
      define_method("#{name}_cell") do
        puts "#{name}_cell method generated"
        driver.td(identifier)
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
    #
    def span(name, identifier)
      define_method(name) do
        puts "#{name} method generated"
        driver.span(identifier).text
      end
      define_method("#{name}_span") do
        puts "#{name}_span method generated"
        driver.span(identifier)
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
      define_method("#{name}_image") do
        puts "#{name}_image method generated"
        driver.image(identifier)
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
    #
    def form(name, identifier)
      define_method("#{name}_form") do
        puts "#{name}_form method generated"
        driver.form(identifier)
      end
    end
  end

end
