module Druid
  module Elements
    class CheckBox < Element

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
  end
end
