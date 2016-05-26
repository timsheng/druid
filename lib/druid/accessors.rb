
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
  end

end
