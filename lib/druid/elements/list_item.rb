module Druid
  module Elements
    class ListItem < Element

      def self.finders
        super + [:text]
      end

    end

    Druid::Elements.tag_to_class[:li] = Druid::Elements::ListItem
  end
end
