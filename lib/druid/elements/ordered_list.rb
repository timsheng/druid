module Druid
  module Elements
    class OrderedList < Element
      attr_accessor :li_element

      def [](idx)
        if element.li(:xpath, ".//li[#{idx+1}]").exist?
          element.li(:xpath, ".//li[#{idx+1}]")
        else
          print "the sub element of ol is not li"+"\n"
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
