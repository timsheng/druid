module Druid
  module Elements
    class Form < Element

      def self.finders
        super + [:action]
      end
      #
      # Submit the form
      #
      def submit
        element.submit
      end
    end
  end
end
