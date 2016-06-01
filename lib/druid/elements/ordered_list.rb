module Druid
  module Elements
    class OrderedList < Element

      def [](idx)
        if element.li(:xpath,".//li[#{idx+1}]").exist?
          element.li(:xpath,".//li[#{idx+1}]")
        else
          print "the sub element of ol is not li"+"\n"
        end
      end

    end
  end
end
