module Druid
  module Elements
    class TextArea < Element

      def self.finders
        super + [:tag_name]
      end

      def self.mapping
        super.merge({:css => :tag_name})
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
