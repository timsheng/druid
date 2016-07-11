module Druid
  module ElementLocators

    #
    # Finds a button
    #
    # @param [Hash] identifier how we find a button.  You can use a multiple paramaters
    #  by combining of any of the following except xpath.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :text
    #   * :value
    #   * :xpath
    #
    def button_element identifier
      button_for identifier
    end

    #
    # Finds a text field
    #
    # @param [Hash] identifier how we find a text field. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :css
    #   * :id
    #   * :index
    #   * :name
    #   * :tag_name
    #   * :text
    #   * :value
    #   * :xpath
    #
    def text_field_element identifier
      text_field_for identifier
    end

    #
    # Finds a hidden field
    #
    # @param [Hash] identifier how we find a hidden field. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :css
    #   * :id
    #   * :index
    #   * :name
    #   * :tag_name
    #   * :text
    #   * :xpath
    #
    def hidden_field_element identifier
      hidden_field_for identifier
    end

    #
    # Finds a text area
    #
    # @param [Hash] identifier how we find a text area. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :css
    #   * :id
    #   * :index
    #   * :name
    #   * :tag_name
    #   * :xpath
    #
    def text_area_element identifier
      text_area_for identifier
    end

    #
    # Finds a select list
    #
    # @param [Hash] identifier how we find a select list. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :value
    #   * :text
    #
    def select_list_element identifier
      select_list_for identifier
    end

    #
    # Finds a link
    #
    # @param [Hash] identifier how we find a link. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :href
    #   * :id
    #   * :index
    #   * :link
    #   * :link_text
    #   * :name
    #   * :xpath
    #   * :text
    #
    def link_element identifier
      link_for identifier
    end

    #
    # Finds a check box
    #
    # @param [Hash] identifier how we find a check box. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def checkbox_element identifier
      checkbox_for identifier
    end

    #
    # Finds a radio button
    #
    # @param [Hash] identifier how we find a radio button. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def radio_button_element identifier
      radio_button_for identifier
    end

    #
    # Finds a div
    #
    # @param [Hash] identifier how we find a div. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :text
    #
    def div_element identifier
      div_for identifier
    end

    #
    # Finds a span
    #
    # @param [Hash] identifier how we find a span. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def span_element identifier
      span_for identifier
    end

    #
    # Finds a table
    #
    # @param [Hash] identifier how we find a table. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def table_element identifier
      table_for identifier
    end

    #
    # Finds a table cell
    #
    # @param [Hash] identifier how we find a table cell. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :text
    #
    def cell_element identifier
      cell_for identifier
    end

    #
    # Finds an image
    #
    # @param [Hash] identifier how we find an image. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def image_element identifier
      image_for identifier
    end

    #
    # Finds a form
    #
    # @param [Hash] identifier how we find a form. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #
    def form_element identifier
      form_for identifier
    end

    #
    # Finds a list item
    #
    # @param [Hash] identifier how we find a list item. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def list_item_element identifier
      list_item_for identifier
    end

    #
    # Finds an ordered list
    #
    # @param [Hash] identifier how we find an ordered list. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def ordered_list_element identifier
      ordered_list_for identifier
    end
  end
end
