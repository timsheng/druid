module Druid
  module Elements
    class SelectList < Element

      def self.finders
        super + [:value, :text]
      end

      def [](idx)
        Druid::Elements::Option.new(element.options[idx])
      end

      def options
        element.options
      end
    end
  end
end
