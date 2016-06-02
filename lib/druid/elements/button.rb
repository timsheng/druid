module Druid
  module Elements
    class Button < Element

      def self.identifier_for identifier
        identifier_for_element identifier, finders, mapping
      end

      def self.finders
        super + [:text]
      end

    end
  end
end
