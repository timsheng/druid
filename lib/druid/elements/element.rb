require 'watir/extensions/select_text'
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
      # Get the value of the given attribute of the element
      # @param [String]
      # @return [String, nil]
      #
      def attribute(attribute_name)
        element.attribute_value attribute_name
      end

      #
      # retrieve the class name for an element
      #
      def class_name
        element.class_name
      end

      def inspect
        element.inspect
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
        timed_loop(timeout) do |element|
          element.visible?
        end
      end

      def check_exist(timeout=Druid.default_element_wait)
        timed_loop(timeout) do |element|
          element.exist?
        end
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
      # Waits until the element is present
      #
      # @param [Integer] (defaults to: 5) seconds to wait before
      # timing out
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
        element.wait_while(timeout: timeout, message: "Element still present after #{timeout} seconds", &:present?)
      end

      #
      # Waits until the element is visible
      #
      # @param [Interger] (default to:5) seconds to wait before timing out
      #
      def when_visible(timeout=Druid.default_element_wait)
        when_present(timeout)
        element.wait_until(timeout: timeout, message: "Element not visible in #{timeout} seconds", &:visible?)
        self
      end

      #
      # Waits until the element is not visible
      #
      # @param [Integer] (default to:5) seconds to wait before timing out
      #
      def when_not_visible(timeout=Druid.default_element_wait)
        when_present(timeout)
        element.wait_while(timeout: timeout, message: "Element still visible after #{timeout} seconds", &:visible?)
        self
      end

      #
      # Waits until the block returns true
      #
      # @param [Integer] (default to:5) seconds to wait before timing out
      #
      def wait_until(timeout=Druid.default_element_wait, message=nil, &block)
        element.wait_until(timeout: timeout, message: message, &block)
      end


      # @private
      def self.identifier_for identifier
        if have_to_build_xpath(identifier)
          how = :xpath
          what = build_xpath_for(identifier)
          return how => what
        end
        all_identities = {}
        identifier.each do |key, value|
          each = {key => value}
          ident = identifier_for_element each, finders, mapping
          all_identities[ident.keys.first] = ident.values.first
        end
        all_identities
        # end
      end

      # @private
      # delegate calls to driver element
      def method_missing(*args, &block)
        m = args.shift
        element.send m, *args, &block
      end

      protected

      def self.have_to_build_xpath(identifier)
        ['table', 'span', 'div', 'td', 'li', 'ol', 'ul', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'p', 'label', 'area', 'canvas', 'audio', 'video', 'b', 'i'].include? identifier[:tag_name] and identifier[:name]
      end

      def self.build_xpath_for identifier
        tag_locator = identifier.delete(:tag_name)
        idx = identifier.delete(:index)
        if tag_locator == 'input' and identifier[:type] == 'submit'
          identifier.delete(:type)
          btn_ident = identifier.clone
          if btn_ident[:value]
            btn_ident[:text] = btn_ident[:value]
            btn_ident.delete(:value)
          end
          xpath = ".//button"
          xpath << "[#{attribute_expression(btn_ident)}]" unless btn_ident.empty?
          xpath = "(#{xpath})[#{idx+1}]" if idx
          identifier[:type] = %w[button reset submit image]
          xpath << " | .//input"
        else
          xpath = ".//#{tag_locator}"
        end
        xpath << "[#{attribute_expression(identifier)}]" unless identifier.empty?
        xpath = "(#{xpath})[#{idx+1}]" if idx
        xpath
      end

      def self.attribute_expression(identifier)
        identifier.map do |key, value|
          if value.kind_of?(Array)
            "(" + value.map { |v| equal_pair(key, v) }.join(" or ") + ")"
          else
            equal_pair(key, value)
          end
        end.join(" and ")
      end

      def self.equal_pair(key, value)
        if key == :label
          "@id=//label[normalize-space()=#{xpath_string(value)}]/@for"
        else
          "#{lhs_for(key)}=#{xpath_string(value)}"
        end
      end

      def self.lhs_for(key)
        case key
        when :text, 'text'
          'normalize-space()'
        when :href
          'normalize-space(@href)'
        else
          "@#{key.to_s.gsub("_", "-")}"
        end
      end

      def self.xpath_string(value)
        if value.include? "'"
          parts = value.split("'", -1).map { |part| "'#{part}'" }
          string = parts.join(%{,"'",})
          "concat(#{string})"
        else
          "'#{value}'"
        end
      end

      def self.identifier_for_element identifier, find_by, find_by_mapping
        how, what = identifier.keys.first, identifier.values.first
        return how => what if find_by.include? how
        return find_by_mapping[how] => what if find_by_mapping[how]
        identifier
      end

      def self.finders
        [:class, :id, :index, :name, :xpath]
      end

      def self.mapping
        {}
      end

      private

      def timed_loop(timeout)
        end_time = Time.now + timeout
        until Time.now > end_time
          result = yield(self)
          return result if result
          sleep 0.5
        end
        false
      end
    end
  end
end
