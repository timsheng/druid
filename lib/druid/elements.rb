module Druid
  module Elements
    class << self

      def type_to_class
        @type_to_class ||= {}
      end

      # method to return the collection of tag_name class mappings
      def tag_to_class
        @tag_to_class ||= {}
      end

      #
      # method to return the element for a tag_name
      #
      def element_class_for(tag_name, type=nil)
        return type_to_class[type.to_sym] if type
        tag_to_class[tag_name.to_sym] || Druid::Elements::Element
      end
    end
  end
end

require 'druid/elements/element.rb'
require 'druid/elements/ordered_list.rb'
require 'druid/elements/unordered_list.rb'
require 'druid/elements/table.rb'
require 'druid/elements/table_row.rb'
require 'druid/elements/select_list.rb'
require 'druid/elements/link.rb'
require 'druid/elements/button.rb'
require 'druid/elements/check_box.rb'
require 'druid/elements/radio_button.rb'
require 'druid/elements/text_field.rb'
require 'druid/elements/div.rb'
require 'druid/elements/table_cell.rb'
require 'druid/elements/image.rb'
require 'druid/elements/span.rb'
require 'druid/elements/hidden_field.rb'
require 'druid/elements/list_item.rb'
require 'druid/elements/text_area.rb'
require 'druid/elements/form.rb'
require 'druid/elements/option.rb'
require 'druid/elements/heading.rb'
require 'druid/elements/paragraph.rb'
require 'druid/elements/file_field.rb'
require 'druid/elements/label.rb'
