module Druid
  module Elements
    class SelectList < Element

      def self.finders
        super + [:value, :text]
      end

      def [](idx)
        Druid::Elements::Option.new(options[idx])
      end

      def options
        element.options
      end

      #
      # Select a value from the list
      #
      def select(value)
        element.select(value)
      end
    end

    Druid::Elements.tag_to_class[:select] = Druid::Elements::SelectList
  end
end
