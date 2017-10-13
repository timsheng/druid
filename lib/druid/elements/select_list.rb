module Druid
  module Elements
    class SelectList < Element

      def [](idx)
        options[idx]
      end

      def options
        element.options.map { |e| Druid::Elements::Option.new(e)}
      end

      #
      # @return [Array<String>] An array of strings representing the text of the currently selected options.
      #
      def selected_options
        element.selected_options.map(&:text).compact
      end

      #
      # @return [Array<String>] An array of strings representing the value of the currently selected options.
      def selected_values
        element.selected_options.map(&:value).compact
      end

    end

    Druid::Elements.tag_to_class[:select] = Druid::Elements::SelectList
  end
end
