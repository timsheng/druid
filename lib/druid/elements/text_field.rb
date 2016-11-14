module Druid
  module Elements
    class TextField < Element

      def self.finders
        super + [:css, :tag_name, :text, :title]
      end

      #
      # Set the value of the TextField
      #
      def value=(new_value)
        element.set(new_value)
      end
    end

    Druid::Elements.type_to_class[:text] = Druid::Elements::TextField
    Druid::Elements.type_to_class[:password] = Druid::Elements::TextField

  end
end
