module Druid
  module Elements
    class TextField < Element

      def self.identifier_for identifier
        identifier_for_element identifier, finders, mapping
      end

      def self.finders
        super + [:css, :tag_name, :text]
      end

    end
  end
end
