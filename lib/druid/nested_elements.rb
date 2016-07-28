module Druid
  module NestedElements
    def link_element(identifier={:index => 0})
      link_for(identifier)
    end

    def button_element(identifier={:index => 0})
      button_for(identifier)
    end

    def text_field_element(identifier={:index => 0})
      text_field_for(identifier)
    end
  end
end
