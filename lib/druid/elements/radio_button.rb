module Druid
  module Elements
    class RadioButton < Element

      def self.finders
        super + [:value]
      end
      #
      # Select the RadioButton
      #
      def select
        element.set
      end

      #
      # Clear the RadioButton
      #
      def clear
        element.clear
      end

      #
      # Return if it is selected
      #
      def selected?
        element.set?
      end
    end

    Druid::Elements.type_to_class[:radio] = Druid::Elements::RadioButton
  end
end
