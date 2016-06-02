module Druid
  module Elements
    class Element
      attr_accessor :element

      def initialize(element)
        @element = element
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
