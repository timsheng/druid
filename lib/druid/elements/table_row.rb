require 'watir/elements/html_elements'
module Druid
  module Elements
    class TableRow < Element

      #
      # Return the Druid::Elements::TableCell for the index provided. Index
      # is zero based. If the index provided is a String then it
      # will be matched with the text from the columns in the first row.
      #
      def [](what)
        idx = find_index(what)
        idx && cell_items[idx]
      end

      #
      # Returns the number of colums in the table
      #
      def columns
        cell_items.size
      end

      #
      # iterator that yields with a Druid::Elements::TableCell
      #
      def each(&block)
        cell_items.each(&block)
      end

      private

      def cell_items
        @cell_items ||= element.cells.map do |obj|
          Druid::Elements::TableCell.new(obj)
        end
      end

      def find_index(what)
        return what if what.is_a? Integer
        parent(tag_name: 'table').headers.find_index do |header|
          header.text.include? what
        end
      end

    end

    Druid::Elements.tag_to_class[:tr] = Druid::Elements::TableRow

  end
end
