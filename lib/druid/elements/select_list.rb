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
  end
end
