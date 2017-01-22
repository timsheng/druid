module Druid
  module Elements
    class Table < Element
      #
      # Return the Druid::Elements::Table for the index provided.  Index
      # is zero based. If the index provided is a String then it
      # will be matched with the text from any column. The text can be
      # a substring of the full column text.
      #
      # @return [Druid::Elements::Table]
      #
      def [](idx)
        idx = find_index_by_title(idx) if idx.kind_of?(String)
        return nil unless idx
        Druid::Elements::TableRow.new(element[idx])
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

      #
      # return the table as hashes
      #
      def hashes
        element.hashes
      end

      private

      def find_index_by_title(row_title)
        element.rows.find_index do |row|
          row.cells.any? { |col| col.text.include? row_title}
        end
      end

    end

    Druid::Elements.tag_to_class[:table] = Druid::Elements::Table
  end
end
