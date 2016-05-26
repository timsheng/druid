
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
        puts driver.link(identifier).click
      end
      define_method("#{name}_link") do
        puts "#{name}_link method generated"
        driver.link(identifier)
      end
    end
  end

end
