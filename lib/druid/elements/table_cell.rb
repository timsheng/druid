module Druid
  module Elements
    class TableCell < Element

      def self.identifier_for identifier
        identifier_for_element identifier, finders, mapping
      end

    end
  end
end
