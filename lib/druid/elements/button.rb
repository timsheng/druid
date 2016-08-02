module Druid
  module Elements
    class Button < Element

      def self.finders
        super + [:value, :text, :src]
      end

    end
  end
end
