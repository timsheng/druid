require 'druid/nested_elements'
require 'druid/assist'
module Druid
  module Elements
    #
    # Contains functionality that is common across all elements
    #
    class Element
      include Druid::NestedElements
      include Druid::Assist

      attr_accessor :element
      attr_accessor :driver

      def initialize(element)
        @element = element
        @driver = @element
      end

      #
      # return true if the element is not enabled
      def disabled?
        not enabled?
      end

      #
      # compare this element to another to determine if they are equal
      # @return [Boolean]
      #
      def ==(other)
        other.is_a? self.class and element == other.element
      end

      #
      # retrieve the value of specified attribute
      #
      def attribute(*args)
        attribute_value(*args)
      end

      #
      # Scroll until the element is viewable
      #
      def scroll_into_view
        element.wd.location_once_scrolled_into_view
      end

      #
      # location of element (x,y)
      #
      def location
        element.wd.location
      end

      #
      # size of element (width, height)
      #
      def size
        element.wd.size
      end

      #
      # Get width of element
      #
      def width
        size['width']
      end

      #
      # Get height of element
      #
      def height
        size['height']
      end

      #
      # Get centre coordinates of element
      #
      def centre
        { 'y' => (location['y'] + (size['height']/2)), 'x' => (location['x'] + (size['width']/2)) }
      end

      def check_visible(timeout=Druid.default_element_wait)
        wait_until(timeout: timeout, message: "Element not visible in #{timeout} seconds", &:present?)
      end
      alias_method :when_present, :check_visible
      alias_method :when_visible, :check_visible

      def check_exist(timeout=Druid.default_element_wait)
        wait_until(timeout: timeout, &:exist?)
      end

      #
      # Returns parent element of current element.
      def parent
        parent = element.parent
        type = element.type if parent.tag_name.to_sym == :input
        cls = Druid::Elements.element_class_for(parent.tag_name, type)
        cls.new(parent)
      end

      #
      # Waits until the element is not present
      #
      # @param [Integer] (defaults to: 5) seconds to wait before
      # timing out
      #
      def when_not_present(timeout=Druid.default_element_wait)
        element.wait_while_present(timeout: timeout)
      end

      #
      # Waits until the element is not visible
      #
      # @param [Integer] (default to:5) seconds to wait before timing out
      #
      def when_not_visible(timeout=Druid.default_element_wait)
        when_present(timeout)
        element.wait_while(timeout: timeout, message: "Element still visible after #{timeout} seconds", &:visible?)
      end

      # @private
      # delegate calls to driver element
      def method_missing(*args, &block)
        m = args.shift
        element.send m, *args, &block
      end

      def respond_to_missing?(m,*args)
        element.respond_to?(m) || super
      end

    end
  end
end
