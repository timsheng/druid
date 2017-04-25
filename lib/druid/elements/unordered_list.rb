module Druid
  module Elements
    class UnOrderedList < Element

      def [](idx)
        Druid::Elements::ListItem.new(children[idx])
      end

      def items
        children.size
      end

      def each
        for index in 1..self.items do
          yield self[index-1]
        end
      end

      #
      # return the ListItem objects that are children of the
      # UnOrderedList
      #
      def list_items
        children.collect do |obj|
          Druid::Elements::ListItem.new(obj)
        end
      end

      protected

      def child_xpath
        "./child::li"
      end

      private

      def children
        element.uls(:xpath => child_xpath)
      end
    end

    Druid::Elements.tag_to_class[:ul] = Druid::Elements::UnOrderedList

  end
end
