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
  end
end
