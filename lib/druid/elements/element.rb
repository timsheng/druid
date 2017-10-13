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

      def check_visible(timeout=Druid.default_element_wait)
        timed_loop(timeout) do |element|
          element.visible?
        end
        # wait_until(timeout: timeout, message: "Element not visible in #{timeout} seconds", &:present?)
      end
      # alias_method :when_present, :check_visible
      # alias_method :when_visible, :check_visible

      def check_exist(timeout=Druid.default_element_wait)
        timed_loop(timeout) do |element|
          element.exists?
        end
        # wait_until(timeout: timeout, &:exist?)
      end

      #
      # find the parent element
      #
      def parent(opt = {})
        parent = element.parent(opt)
        type = element.type if parent.tag_name.to_sym == :input
        cls = Druid::Elements.element_class_for(parent.tag_name, type)
        cls.new(parent.to_subtype)
      end

      #
      # Wait until the element is present
      #
      # @param [Integer] (defaults to: 5) seconds to wait before timing out
      #
      def when_present(timeout=Druid.default_element_wait)
        element.wait_until(timeout: timeout, message: "Element not present in #{timeout} seconds", &:present?)
        self
      end

      #
      # Waits until the element is not present
      #
      # @param [Integer] (defaults to: 5) seconds to wait before
      # timing out
      #
      def when_not_present(timeout=Druid.default_element_wait)
        element.wait_while(timeout: timeout, message: "Element still present in #{timeout} seconds", &:present?)
      end

      #
      # Wait until the element is visible
      #
      # @param [Integer] (defaults to: 5) seconds to wait before timing out
      #
      def when_visible(timeout=Druid.default_element_wait)
        when_present(timeout)
        element.wait_until(timeout: timeout, message: "Element not visible in #{timeout} seconds", &:visible?)
        self
      end

      #
      # Waits until the element is not visible
      #
      # @param [Integer] (default to: 5) seconds to wait before timing out
      #
      def when_not_visible(timeout=Druid.default_element_wait)
        when_present(timeout)
        element.wait_while(timeout: timeout, message: "Element still visible after #{timeout} seconds", &:visible?)
      end

      #
      # Waits until the block returns true
      #
      # @param [Integer] (defaults to: 5) seconds to wait before timing out
      # @param [String] the message to display if the event timeouts
      # @param the block to execute when the event occurs
      #
      def wait_until(timeout=Druid.default_element_wait, message=nil, &block)
        element.wait_until(timeout: timeout, message: message, &block)
      end

      def name
        element.attribute(:name)
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

      private

      def timed_loop(timeout)
        end_time = ::Time.now + timeout
        until ::Time.now > end_time
          result = yield(self)
          return result if result
          sleep 0.5
        end
        false
      end

    end
  end
end
