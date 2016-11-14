module Druid
  module Elements
    class Button < Element

      def self.finders
        super + [:value, :text, :src, :alt]
      end

    end

    Druid::Elements.type_to_class[:submit] = Druid::Elements::Button
    Druid::Elements.type_to_class[:image] = Druid::Elements::Button
    Druid::Elements.type_to_class[:button] = Druid::Elements::Button
    Druid::Elements.type_to_class[:reset] = Druid::Elements::Button
  end
end
