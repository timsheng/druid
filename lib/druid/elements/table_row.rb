module Druid
  module Elements
    class TableRow < Element
      def [](idx)
        table_cell = element[idx]
        Druid::Elements::TableCell.new(table_cell)
      end
      #
      # Returns the number of rows in the table.
      #
      def columns
        element.cells.size
      end

      def each
        for index in 1..self.columns do
          yield self[index-1]
        end
      end

    end

    Druid::Elements.tag_to_class[:tr] = Druid::Elements::TableRow

  end
end
