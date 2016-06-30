module Druid
  module Elements
    #
    # Contains functionality that is common across all elements
    #
    class Element
      attr_accessor :element

      def initialize(element)
        @element = element
      end

      # @private
      def self.identifier_for identifier
        if have_to_build_xpath(identifier)
          how = :xpath
          what = build_xpath_for(identifier)
          return how => what
        else
          all_identities = {}
          identifier.each do |key, value|
            each = {key => value}
            ident = identifier_for_element each, finders, mapping
            all_identities[ident.keys.first] = ident.values.first
          end
          all_identities
        end
      end

      def self.have_to_build_xpath(identifier)
        ['table', 'span', 'div', 'td', 'li', 'ol', 'ul'].include? identifier[:tag_name] and identifier[:name]
      end

      def self.build_xpath_for identifier
        tag_locator = identifier.delete(:tag_name)
        idx = identifier.delete(:index)
        identifier.delete(:tag_name)
        xpath = ".//#{tag_locator}"
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
        return nil => what
      end

      def self.finders
        [:class, :id, :index, :name, :xpath]
      end

      def self.mapping
        {}
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

      def visible?
        element.visible?
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
      # Waits until the element is present
      #
      # @param [Integer] (default to:5) seconds to wait before timing out
      #
      def when_present(timeout=5)
        element.wait_until_present(timeout)
      end

      #
      # Waits until the element is visible
      #
      # @param [Interger] (default to:5) seconds to wait before timing out
      #
      def when_visible(timeout=5)
        Watir::Wait.until(timeout, "Element was not visible in #{timeout} seconds") do
          visible?
        end
      end

      #
      # Waits until the element is not visible
      #
      # @param [Integer] (default to:5) seconds to wait before timing out
      #
      def when_not_visible(timeout=5)
        Watir::Wait.while(timeout, "Element still visible after #{timeout} seconds") do
          visible?
        end
      end

      #
      # Waits until the block returns true
      #
      # @param [Integer] (default to:5) seconds to wait before timing out
      #
      def wait_until(timeout=5, message=nil, &block)
        Watir::Wait.until(timeout, message, &block)
      end
    end
  end
end
