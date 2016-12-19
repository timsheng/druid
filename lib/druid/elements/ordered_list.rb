module Druid
  module Elements
    class OrderedList < Element
      attr_accessor :li_element

      def self.finders
        [:class, :id, :index, :xpath]
      end

      def [](idx)
        items = list_items.find_all { |item| item.parent == element }
        Druid::Elements::ListItem.new(items[idx])
      end

      def items
        element.lis.size
      end

      def each
        for index in 1..self.items do
          yield self[index-1]
        end
      end

      protected

      def child_xpath
        ".//child::li"
      end

      private

      def list_items
        element.ols(:xpath => child_xpath)
      end

    end

    Druid::Elements.tag_to_class[:ol] = Druid::Elements::OrderedList
  end
end
