module Druid
  module Elements
    class TableCell < Element

      def self.finders
        super + [:text]
      end
    end

    Druid::Elements.tag_to_class[:td] = Druid::Elements::TableCell
    Druid::Elements.tag_to_class[:th] = Druid::Elements::TableCell

  end
end
