module Druid
  module Elements
    class SelectList < Element

      def [](idx)
        element.options[idx]
      end


      def options
        element.options
      end
    end
  end
end
