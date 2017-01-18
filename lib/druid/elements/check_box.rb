module Druid
  module Elements
    class CheckBox < Element

      def self.finders
        super + [:value, :label]
      end

      #
      # Check the checkbox
      #
      def check
        element.set
      end

      #
      # Uncheck the CheckBox
      #
      def uncheck
        element.clear
      end

      #
      # Return true if checkbox is checked
      #
      def checked?
        element.set?
      end
    end

    Druid::Elements.type_to_class[:checkbox] = Druid::Elements::CheckBox
  end
end
