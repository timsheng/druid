module Druid
  module Elements
    class Span < Element

      def self.finders
        [:class, :id, :index, :xpath]
      end

    end
  end
end
