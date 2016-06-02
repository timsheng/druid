module Druid
  module Elements
    class Link < Element

      def self.identifier_for identifier
        identifier_for_element identifier, finders, mapping
      end

      protected
      
      def self.finders
         super + [:href, :text]
      end

      def self.mapping
         super.merge({:link => :text, :link_text => :text})
      end
    end
  end
end
