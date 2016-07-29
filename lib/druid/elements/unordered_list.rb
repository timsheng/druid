module Druid
  module Elements
    class UnOrderedList < Element

      def self.finders
        [:class, :id, :index, :xpath]
      end

      def [](idx)
        li = element.li(:xpath,".//li[#{idx+1}]")
        Druid::Elements::ListItem.new(li)
      end

      def items
        element.lis.size
      end

      def each
        for index in 1..self.items do
          yield self[index-1]
        end
      end
    end
  end
end
