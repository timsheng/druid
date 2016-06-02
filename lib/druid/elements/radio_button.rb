module Druid
  module Elements
    class RadioButton < Element

      def self.identifier_for identifier
        identifier_for_element identifier, finders, mapping
      end

    end
  end
end
