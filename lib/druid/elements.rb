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

require 'druid/elements/element'
require 'druid/elements/ordered_list'
require 'druid/elements/unordered_list'
require 'druid/elements/table'
require 'druid/elements/table_row'
require 'druid/elements/select_list'
require 'druid/elements/link'
require 'druid/elements/button'
require 'druid/elements/check_box'
require 'druid/elements/radio_button'
require 'druid/elements/text_field'
require 'druid/elements/div'
require 'druid/elements/table_cell'
require 'druid/elements/image'
require 'druid/elements/span'
require 'druid/elements/hidden_field'
require 'druid/elements/list_item'
require 'druid/elements/text_area'
require 'druid/elements/form'
require 'druid/elements/option'
require 'druid/elements/heading'
require 'druid/elements/paragraph'
require 'druid/elements/file_field'
require 'druid/elements/label'
require 'druid/elements/area'
require 'druid/elements/canvas'
