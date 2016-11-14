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

    Druid::Elements.tag_to_class[:img] = Druid::Elements::Image
  end
end
