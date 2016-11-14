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

    Druid::Elements.tag_to_class[:form] = Druid::Elements::Form
  end
end
