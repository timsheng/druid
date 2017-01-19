module Druid
  module Elements
    class Link < Element

      #
      # return the href fot the link
      #
      def href
        element.href
      end

      protected

      def self.finders
         super + [:href, :text, :css, :title]
      end

      def self.mapping
         super.merge({:link => :text, :link_text => :text})
      end
    end

    Druid::Elements.tag_to_class[:a] = Druid::Elements::Link
  end
end
