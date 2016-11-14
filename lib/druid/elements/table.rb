module Druid
  module Elements
    class Table < Element
      #
      # Return the Druid::Elements::Table for the index provided.  Index
      # is zero based.
      #
      # @return [Druid::Elements::Table]
      #
      def [](idx)
        table_row = element[idx]
        Druid::Elements::TableRow.new(table_row)
      end
      #
      # Returns the number of rows in the table.
      #
      def rows
        element.rows.size
      end

      def each
        for index in 1..self.rows do
          yield self[index-1]
        end
      end

      #
      # return the first row
      #
      # @return Druid::Elements::TableRow
      #
      def first_row
        self[0]
      end

      #
      # return the last row
      #
      # @return Druid::Elements::TableRow
      #
      def last_row
        self[-1]
      end

    end

    Druid::Elements.tag_to_class[:table] = Druid::Elements::Table
  end
end
