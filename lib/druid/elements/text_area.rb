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

      #
      # Clear the TextArea
      #
      def clear
        element.clear
      end

      #
      # append the text to the end of the text in the text area
      #
      def append(text)
        element.append(text)
      end

    end

    Druid::Elements.tag_to_class[:textarea] = Druid::Elements::TextArea

  end
end
