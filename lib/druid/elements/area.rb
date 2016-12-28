module Druid
  module Elements
    class Area < Element

      #
      # Return the coordinates of the area
      #
      def coords
        attribute(:coords)
      end

      #
      # Return the shape of the area
      #
      def shape
        attribute(:shape)
      end

      #
      # Return the href of the area
      #
      def href
        attribute(:href)
      end
    end

    Druid::Elements.type_to_class[:area] = Druid::Elements::Area
  end
end
