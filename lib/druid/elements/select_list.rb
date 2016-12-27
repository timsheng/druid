module Druid
  module Elements
    class SelectList < Element

      def self.finders
        super + [:value, :text]
      end

      def [](idx)
        Druid::Elements::Option.new(options[idx])
      end

      def options
        element.options
      end

      #
      # Select a value from the list
      #
      def select(value)
        element.select(value)
      end

      #
      # Select the options whose value attribute matches the Given
      # string
      #
      def select_value(value)
        element.select_value(value)
      end

      #
      # @return [Array<sTRING>] An array of strings representing the text value of the currently selected options.
      #
      def selected_options
        element.selected_options.map { |e| e.text }.compact
      end

      #
      # Returns true if the select list has one or more options where text or label matches the given value.
      #
      # @param [String, Regexp] value A value
      # @return [Boolean]
      def include? value
        element.include? value
      end

      #
      # Returns true if any of the selected options' text or label match the given value.
      # @param [String, Regexp] value A value
      # @return [Boolean]
      def selected? value
        element.selected? value
      end
    end

    Druid::Elements.tag_to_class[:select] = Druid::Elements::SelectList
  end
end
