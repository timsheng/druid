module Druid
  module Elements
    class TextArea < Element

      def self.finders
        super + [:label]
      end
      #
      # Set the value of the TextArea
      #
      def value=(new_value)
        element.set(new_value)
      end

    end

    Druid::Elements.tag_to_class[:textarea] = Druid::Elements::TextArea

  end
end
