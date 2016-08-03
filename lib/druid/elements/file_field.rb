module Druid
  module Elements
    class FileField < Element
      def self.finders
        super + [:title]
      end

      #
      # Set the value of the FileField
      #
      def value=(new_value)
        element.set(new_value)
      end
    end
  end
end
