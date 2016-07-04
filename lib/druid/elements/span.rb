module Druid
  module Elements
    class Span < Element

      def self.finders
        [:class, :id, :index, :xpath, :text]
      end

    end
  end
end
