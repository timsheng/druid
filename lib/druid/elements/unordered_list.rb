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

    end
  end
end
