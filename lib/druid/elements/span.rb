module Druid
  module Elements
    class Span < Element

      def self.finders
        [:class, :id, :index, :xpath, :text]
      end

    end

    Druid::Elements.tag_to_class[:span] = Druid::Elements::Span
  end
end
