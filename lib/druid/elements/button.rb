module Druid
  module Elements
    class Button < Element

      def self.finders
        super + [:value, :text, :src, :alt]
      end

    end
  end
end
