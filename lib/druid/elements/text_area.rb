module Druid
  module Elements
    class TextArea < Element

      def self.finders
        super + [:tag_name]
      end

      def self.mapping
        super.merge({:css => :tag_name})
      end

    end
  end
end
