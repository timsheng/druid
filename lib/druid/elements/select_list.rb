module Druid
  module Elements
    class SelectList < Element

      def self.finders
        super + [:value, :text]
      end

      def [](idx)
        element.options[idx]
      end

      def options
        element.options
      end
    end
  end
end
