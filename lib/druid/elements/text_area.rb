module Druid
  module Elements
    class TextArea < Element

      def self.finders
        super + [:tag_name, :css]
      end

    end
  end
end
