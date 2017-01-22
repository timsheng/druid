module Druid
  module Elements
    class SelectList < Element

      def self.finders
        super + [:value, :text, :label]
      end

      def [](idx)
        options[idx]
      end

      def options
        element.options.map { |e| Druid::Elements::Option.new(e)}
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
      # @return [Array<String>] An array of strings representing the text of the currently selected options.
      #
      def selected_options
        element.selected_options.map { |e| e.text }.compact
      end

      #
      # @return [Array<String>] An array of strings representing the value of the currently selected options.
      def selected_values
        element.selected_options.map { |e| e.value }.compact
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
