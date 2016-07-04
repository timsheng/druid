module Druid
  module Elements
    class Button < Element

      def self.finders
        super + [:value, :text]
      end

    end
  end
end
