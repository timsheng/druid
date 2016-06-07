module Druid
  module Elements
    class Div < Element

      def self.finders
        [:class, :id, :index, :xpath]
      end
    end
  end
end
