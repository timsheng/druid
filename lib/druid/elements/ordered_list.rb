module Druid
  module Elements
    class OrderedList < Element
      attr_accessor :li_element

      def self.finders
        [:class, :id, :index, :xpath]
      end

      def [](idx)
        li = element.li(:xpath, ".//li[#{idx+1}]")
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

    Druid::Elements.tag_to_class[:ol] = Druid::Elements::OrderedList
  end
end
