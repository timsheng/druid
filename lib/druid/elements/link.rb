module Druid
  module Elements
    class Link < Element

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
