module Druid
  module Elements
    class RadioButton < Element

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
  end
end
