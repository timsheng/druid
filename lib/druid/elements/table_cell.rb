module Druid
  module Elements
    class TableCell < Element

      def self.finders
        super + [:text]
      end
    end
  end
end
