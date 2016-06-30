module Druid
  module Elements
    class HiddenField < Element

      def click
        raise "click is not available on hidden field element with watir"
      end

      def self.finders
        super + [:tag_name, :text]
      end

      def self.mapping
        super.merge({:css => :tag_name})
      end

    end
  end
end
