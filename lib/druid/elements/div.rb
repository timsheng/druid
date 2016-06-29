module Druid
  module Elements
    class Div < Element

      def self.finders
        [:class, :id, :text, :index, :xpath]
      end
    end
  end
end
