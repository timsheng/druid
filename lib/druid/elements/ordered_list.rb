module Druid
  module Elements
    class OrderedList < Element
      attr_accessor :li_element

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
        element.ols(:xpath => child_xpath)
      end

    end

    Druid::Elements.tag_to_class[:ol] = Druid::Elements::OrderedList
  end
end
