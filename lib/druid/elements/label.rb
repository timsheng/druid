module Druid
  module Elements
    class Label < Element
      def self.finders
        super + [:text]
      end

      Druid::Elements.tag_to_class[:label] = Druid::Elements::Label
    end
  end
end
