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
    #   * :src
    #   * :alt
    #
    def button_element identifier
      button_for identifier.clone
    end

    #
    # Finds all buttons that match the provided identifier
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
    #   * :src
    #   * :alt
    #
    def button_elements identifier
      buttons_for identifier.clone
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
    #   * :xpath
    #   * :title
    #
    def text_field_element identifier
      text_field_for identifier.clone
    end

    #
    # Finds all text fields that match the provided identifier
    #
    # @param [Hash] identifier how we find a text field. You can use a multiple parameters
    # by combining of any of the following except xpath. The valid keys are:
    #
    #   * :class
    #   * :css
    #   * :id
    #   * :index
    #   * :name
    #   * :tag_name
    #   * :text
    #   * :xpath
    #   * :title
    #
    def text_field_elements(identifier)
      text_fields_for identifier.clone
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
    #   * :value
    #
    def hidden_field_element identifier
      hidden_field_for identifier.clone
    end

    #
    # Finds all hidden fields that match the identifier
    #
    # @param [Hash] identifier how we find a hidden field. You can use a multiple parameters
    # by combining of any of the following except xpath. The valid keys are:
    #
    #   * :class
    #   * :css
    #   * :id
    #   * :index
    #   * :name
    #   * :tag_name
    #   * :text
    #   * :xpath
    #   * :value
    #
    def hidden_field_elements identifier
      hidden_fields_for identifier.clone
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
      text_area_for identifier.clone
    end

    #
    # Finds all text areas for the provided identifier
    #
    # @param [Hash] identifier how we find a text area. You can use a multiple parameters
    # by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :css
    #   * :id
    #   * :index
    #   * :name
    #   * :tag_name
    #   * :xpath
    #
    def text_area_elements identifier
      text_areas_for identifier.clone
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
      select_list_for identifier.clone
    end

    #
    # Finds all select lists for the provided identifier
    #
    # @param [Hash] identifier how we find a select list. You can use a multiple paramaters
    # by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :value
    #   * :text
    #
    def select_list_elements identifier
      select_lists_for identifier.clone
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
      link_for identifier.clone
    end

    #
    # Finds all links for the provided identifier
    #
    # @param [Hash] identifier how we find a link. You can use a multiple parameters
    # by combining of any of the following except xpath. The valid keys are:
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
    def link_elements identifier
      links_for identifier.clone
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
    #   * :value
    #
    def checkbox_element identifier
      checkbox_for identifier.clone
    end

    #
    # Finds all checkbox elements for the provided identifier
    #
    # @param [Hash] identifier how we find a checkbox. You can use a multiple parameters
    # by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :value
    #
    def checkbox_elements identifier
      checkboxes_for identifier.clone
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
      radio_button_for identifier.clone
    end

    #
    # Finds all radio button elements that match the provided identifier
    #
    # @param [Hash] identifier how we find a radio button. You can use a multiple parameters
    # by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def radio_button_elements identifier
      radio_buttons_for identifier.clone
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
      div_for identifier.clone
    end

    #
    # Finds all divs that match the provided identifier
    #
    # @param [Hash] identifier how we find a div. You can use a multiple parameters
    # by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :text
    #
    def div_elements identifier
      divs_for identifier
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
      span_for identifier.clone
    end

    #
    # Finds all span elements that match the provided identifier
    #
    # @param [Hash] identifier how we find a span. You can use multiple parameters
    # by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def span_elements identifier
      spans_for identifier.clone
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
      table_for identifier.clone
    end

    #
    # Finds all tables with match the provided identifier
    #
    # @param [Hash] identifier how we find a table. You can use a multiple parameters
    # by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def table_elements identifier
      tables_for identifier.clone
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
      cell_for identifier.clone
    end

    #
    # Finds all table cell elements that match the provided identifier
    #
    # @param [Hash] identifier how we find a cell. You can use a multiple parameters
    # by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :text
    #
    def cell_elements identifier
      cells_for identifier.clone
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
    #   * :alt
    #   * :src
    #
    def image_element identifier
      image_for identifier.clone
    end

    #
    # Finds all images that match the provided identifier
    #
    # @param [Hash] identifier how we find an image. You can use a multiple parameters
    # by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :alt
    #   * :src
    #
    def image_elements identifier
      images_for identifier.clone
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
    #   * :action
    #
    def form_element identifier
      form_for identifier.clone
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
      list_item_for identifier.clone
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
      ordered_list_for identifier.clone
    end

    #
    # Finds an unordered list
    #
    # @param [Hash] identifier how we find an unordered list. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def unordered_list_element identifier
      unordered_list_for identifier.clone
    end

    #
    # Finds a h1
    #
    # @param [Hash] identifier how we find a h1. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h1_element identifier
      h1_for identifier.clone
    end

    #
    # Finds a h2
    #
    # @param [Hash] identifier how we find a h2. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h2_element identifier
      h2_for identifier.clone
    end

    #
    # Finds a h3
    #
    # @param [Hash] identifier how we find a h3. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h3_element identifier
      h3_for identifier.clone
    end

    #
    # Finds a h4
    #
    # @param [Hash] identifier how we find a h4. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h4_element identifier
      h4_for identifier.clone
    end

    #
    # Finds a h5
    #
    # @param [Hash] identifier how we find a h5. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h5_element identifier
      h5_for identifier.clone
    end

    #
    # Finds a h6
    #
    # @param [Hash] identifier how we find a h6. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h6_element identifier
      h6_for identifier.clone
    end

    #
    # Finds a paragraph
    #
    # @param [Hash] identifier how we find a paragraph. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def paragraph_element identifier
      paragraph_for identifier.clone
    end

    #
    # Finds a file field
    #
    # @param [Hash] identifier how we find a file field. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #   * :title
    #
    def file_field_element identifier
      file_field_for identifier.clone
    end
  end
end
