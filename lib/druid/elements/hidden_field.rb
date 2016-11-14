module Druid
  module Elements
    class HiddenField < Element

      def click
        raise "click is not available on hidden field element with watir"
      end

      def self.finders
        super + [:tag_name, :text, :value]
      end

      def self.mapping
        super.merge({:css => :tag_name})
      end

    end

    Druid::Elements.type_to_class[:hidden] = Druid::Elements::HiddenField
  end
end
