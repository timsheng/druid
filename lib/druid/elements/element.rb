module Druid
  module Elements
    class Element
      attr_accessor :element

      def initialize(element)
        @element = element
      end

      def text
        @element.text
      end
    end
  end
end
