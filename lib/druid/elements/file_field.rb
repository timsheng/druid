module Druid
  module Elements
    class FileField < Element
      def self.finders
        super + [:title, :label]
      end

      #
      # Set the value of the FileField
      #
      def value=(new_value)
        element.set(new_value)
      end
    end

    Druid::Elements.type_to_class[:file] = Druid::Elements::FileField
  end
end
