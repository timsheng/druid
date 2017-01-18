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
      # Get the text for the element
      #
      # @return [String]
      #
      def text
        element.text
      end

      def exist?
        element.exist?
      end

      def enabled?
        element.enabled?
      end

      #
      # return true if the element is not enabled
      def disabled?
        not enabled?
      end

      def visible?
        element.visible?
      end

      #
      # Get the html for the element
      #
      # @return [String]
      #
      def html
        element.html
      end

      #
      # Get the value of this element
      #
      # @return [String]
      #
      def value
        element.value
      end

      #
      # compare this element to another to determine if they are equal
      # @return [Boolean]
      #
      def ==(other)
        element == other.element
      end

      #
      # Get the tag name of this element
      #
      # @return [String]
      #
      def tag_name
        element.tag_name
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
      # Click this element
      #
      def click
        element.click
      end

      #
      # get the value of the given CSS property
      #
      def style(property)
        element.style property
      end

      def inspect
        element.inspect
      end

      #
      # Send keystrokes to this element
      #
      # @param [String, Symbol, Array]
      #
      # Examples:
      #
      #  element.send_keys "foo"                    #=> value: 'foo'
      #  element.send_keys "tet", :arrow_left, "s"  #=> value: 'test'
      #  element.send_keys [:control, 'a'], :space  #=> value: ' '
      #
      def send_keys(*args)
        element.send_keys(*args)
      end

      #
      # clear the contents of the element
      #
      def clear
        element.clear
      end

      #
      # double click this element
      #
      def double_click
        element.double_click
      end

      #
      # right click this element
      #
      def right_click
        element.right_click
      end

      #
      # Fire the provided event on the current element
      #
      def fire_event(event_name)
        element.fire_event(event_name)
      end

      def focus
        element.focus
      end

      #
      # get the id of element
      #
      def id
        attribute(:id)
      end

      #
      # Scroll until the element is viewable
      #
      def scroll_into_view
        element.wd.location_once_scrolled_into_view
      end

      #
      # Flash the element by temporarily changing the background color
      #
      def flash
        element.flash
      end

      #
      # hover over the element
      #
      def hover
        element.hover
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
        element.wait_until_present(timeout)
        self
      end

      #
      # Waits until the element is not present
      #
      # @param [Integer] (defaults to: 5) seconds to wait before
      # timing out
      #
      def when_not_present(timeout=Druid.default_element_wait)
        element.wait_while_present(timeout)
      end

      #
      # Waits until the element is visible
      #
      # @param [Interger] (default to:5) seconds to wait before timing out
      #
      def when_visible(timeout=Druid.default_element_wait)
        Watir::Wait.until(timeout, "Element was not visible in #{timeout} seconds") do
          visible?
        end
        self
      end

      #
      # Waits until the element is not visible
      #
      # @param [Integer] (default to:5) seconds to wait before timing out
      #
      def when_not_visible(timeout=Druid.default_element_wait)
        Watir::Wait.while(timeout, "Element still visible after #{timeout} seconds") do
          visible?
        end
        self
      end

      #
      # Waits until the block returns true
      #
      # @param [Integer] (default to:5) seconds to wait before timing out
      #
      def wait_until(timeout=Druid.default_element_wait, message=nil, &block)
        Watir::Wait.until(timeout, message, &block)
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
      def method_missing(m, *args, &block)
        $stderr.puts "*** DEPRECATION WARNING"
        $stderr.puts "*** You are calling a method named #{m} at #{caller[0]}."
        $stderr.puts "*** This method does not exist in druid so it is being passed to the driver."
        $stderr.puts "*** This feature will be removed in the near future."
        $stderr.puts "*** Please change your code to call the correct druid method."
        $stderr.puts "*** If you are using functionality that does not exist in druid please request it be added."
        unless element.respond_to?(m)
          raise NoMethodError, "undefined method `#{m}` for #{element.inspect}:#{element.class}"
        end
        element.__send__(m, *args, &block)
      end

      protected

      def self.have_to_build_xpath(identifier)
        ['table', 'span', 'div', 'td', 'li', 'ol', 'ul', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'p', 'label', 'area', 'canvas', 'audio', 'video'].include? identifier[:tag_name] and identifier[:name]
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
          xpath << "[#{idx+1}]" if idx
          identifier[:type] = %w[button reset submit image]
          xpath << " | .//input"
        else
          xpath = ".//#{tag_locator}"
        end
        xpath << "[#{attribute_expression(identifier)}]" unless identifier.empty?
        xpath << "[#{idx+1}]" if idx
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

    end
  end
end
