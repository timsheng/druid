module Druid
  module Elements
    class Div < Element

      def self.finders
        super + [:text, :title]
      end
    end

    Druid::Elements.tag_to_class[:div] = Druid::Elements::Div
  end
end
