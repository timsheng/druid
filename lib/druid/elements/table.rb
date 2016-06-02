module Druid
  module Elements
    class Table < Element

      def self.identifier_for identifier
        identifier_for_element identifier, finders, mapping
      end
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

    end
  end
end
