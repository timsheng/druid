module Druid
  module Elements
    class Element
      attr_accessor :element

      def initialize(element)
        @element = element
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

      def text
        element.text
      end

      def exist?
        element.exist?
      end

      def visible?
        element.visible?
      end

      def value
        element.value
      end

      def tag_name
        element.tag_name
      end

      def attribute_value(attribute_name)
        element.attribute_value attribute_name
      end

      def click
        element.click
      end
    end
  end
end
