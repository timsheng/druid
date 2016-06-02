module Druid
  module Elements
    class Button < Element

      def self.finders
        super + [:text]
      end

    end
  end
end
