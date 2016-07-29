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

    def hidden_field_element(identifier={:index => 0})
      hidden_field_for(identifier)
    end

    def text_area_element(identifier={:index => 0})
      text_area_for(identifier)
    end

    def select_list_element(identifier={:index => 0})
      select_list_for(identifier)
    end

    def checkbox_element(identifier={:index => 0})
      checkbox_for(identifier)
    end

    def radio_button_element(identifier={:index => 0})
      radio_button_for(identifier)
    end

    def div_element(identifier={:index => 0})
      div_for(identifier)
    end

    def span_element(identifier={:index => 0})
      span_for(identifier)
    end
  end
end
