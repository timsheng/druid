module Druid
  module Elements
    class UnOrderedList < Element

      #
      # @return [Druid::Elements::ListItem]
      #
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
      # Return Array of ListItem objects that are children of the UnorderedList
      #
      def list_items
        @list_items ||= children(tag_name: 'li')
      end

    end

    Druid::Elements.tag_to_class[:ul] = Druid::Elements::UnOrderedList

  end
end
