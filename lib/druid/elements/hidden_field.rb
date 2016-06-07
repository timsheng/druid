module Druid
  module Elements
    class HiddenField < Element
      
      def self.finders
        super + [:tag_name, :text, :css]
      end

    end
  end
end
