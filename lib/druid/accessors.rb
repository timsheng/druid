
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
    #   :class => Watir and Selenium
    #   :id => Watir and Selenium
    #   :index => Watir only
    #   :name => Watir and Selenium
    #   :xpath => Watir and Selenium
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
  end

end
