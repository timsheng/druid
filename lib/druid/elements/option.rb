module Druid
  module Elements
    class Option < Element

      #
      # returns true if the option is selected
      #
      def selected?
        element.selected?
      end
    end

    Druid::Elements.tag_to_class[:option] = Druid::Elements::Option
  end
end
