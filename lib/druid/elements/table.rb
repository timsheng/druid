module Druid
  module Elements
    class Table < Element
      #
      # Return the Druid::Elements::Table for the index provided.  Index
      # is zero based. If the index provided is a String then it
      # will be matched with the text from any column. The text can be
      # a substring of the full column text.
      #
      # @return [Druid::Elements::TableRow]
      #
      def [](what)
        idx = find_index(what)
        idx && row_items[idx]
      end

      #
      # Returns the number of rows in the table.
      #
      def rows
        row_items.size
      end

      #
      # iterator that yields with a Druid::Elements::TableRow
      #
      # @return [Druid::Elements::TableRow]
      #
      def each(&block)
        row_items.each(&block)
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
      # Returns the Array of values(String) in a column for the index provided. Index
      # is zero based. If the index provided is a String then it
      # will be matched with the text from the header. The text can be a substring of the full header text
      #
      def column_values(what)
        idx = find_index_of_header(what)
        idx && row_items.drop(1).collect{ |row| row.cell(index: idx).text }
      end

      private

      def row_items
        meth = stragegy == :descendants ? :trs : :rows
        @row_items ||= element.send(meth).map do |obj|
          Druid::Elements::TableRow.new(obj)
        end
      end

      def stragegy
        :children
      end

      def find_index_of_header(what)
        return what if what.is_a? Integer
        row_items[0].cells.find_index do |cell|
          cell.text.include? Regexp.escape(what)
        end
      end

      def find_index(what)
        return what if what.is_a? Integer
        row_items.find_index do |row|
          row.cell(text: /#{Regexp.escape(what)}/).exist?
        end
      end

    end

    Druid::Elements.tag_to_class[:table] = Druid::Elements::Table
  end
end
