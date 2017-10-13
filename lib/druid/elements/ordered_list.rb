module Druid
  module Elements
    class OrderedList < Element
      attr_accessor :li_element

      def [](idx)
        list_items[idx]
      end

      def items
        list_items.size
      end

      def each(&block)
        list_items.each(&block)
      end

      #
      # Return Array of ListItem objects that are children of the OrderedList
      #
      def list_items
        @list_items ||= children(tag_name: 'li').map do |obj|
          Druid::Elements::ListItem.new(obj)
        end
      end

    end

    Druid::Elements.tag_to_class[:ol] = Druid::Elements::OrderedList
  end
end
