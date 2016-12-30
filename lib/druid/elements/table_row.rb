module Druid
  module Elements
    class TableRow < Element

      #
      # Return the Druid::Elements::TableCell for the index provided. Index
      # is zero based. If the index provided is a String then it
      # will be matched with the text from the columns in the first row.
      #
      def [](idx)
        idx = find_index_by_title(idx) if idx.kind_of?(String)
        return nil unless idx
        Druid::Elements::TableCell.new(element[idx])
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

      private

      def find_index_by_title(title)
        table = element.parent
        table = table.parent if table.tag_name == 'tbody'
        first_row = table[0]
        first_row.cells.find_index { |column| column.text.include? title}
      end

    end

    Druid::Elements.tag_to_class[:tr] = Druid::Elements::TableRow

  end
end
