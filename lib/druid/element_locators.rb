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
    def button identifier
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
    def text_field identifier
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
    def hidden_field identifier
      hidden_field_for identifier
    end
  end
end
