module Druid
  module Elements
    class Image < Element

      def self.finders
        super + [:alt, :src]
      end

      def width
        element.width
      end

      def height
        element.height
      end
    end
  end
end
