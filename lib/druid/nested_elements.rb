module Druid
  module NestedElements
    def link_element(identifier)
      link_for(identifier)
    end

    def button_element(identifier)
      button_for(identifier)
    end

    def text_field_element(identifier)
      text_field_for(identifier)
    end
  end
end
