module Druid
  module Elements
    class UnOrderedList < Element

      def [](idx)
        if element.li(:xpath,".//li[#{idx+1}]").exist?
          element.li(:xpath,".//li[#{idx+1}]")
        else
          print "the sub element of ul is not li"+"\n"
        end
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
