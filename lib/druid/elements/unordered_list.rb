module Druid
  module Elements
    class UnOrderedList < Element

      def self.finders
        [:class, :id, :index, :xpath]
      end

      def [](idx)
        items = list_items.find_all { |item| item.parent == element}
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
        element.uls(:xpath => child_xpath)
      end
    end

    Druid::Elements.tag_to_class[:ul] = Druid::Elements::UnOrderedList

  end
end
