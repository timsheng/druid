module Druid
  module Elements
    class Canvas < Element

      #
      # return the width of the canvas
      #
      def width
        attribute(:width).to_i
      end

      #
      # return the height of the canvas
      #
      def height
        attribute(:height).to_i
      end
    end

    Druid::Elements.type_to_class[:canvas] = Druid::Elements::Canvas
  end
end
