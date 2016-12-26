module Druid
  module ElementLocators

    #
    # Finds a button
    #
    # @param [Hash] identifier how we find a button.  You can use a multiple paramaters
    #  by combining of any of the following except xpath. It defaults to {:index => 0}
    #  which will find the first button. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :text
    #   * :value
    #   * :xpath
    #   * :src
    #   * :alt
    #   * :css
    #
    def button_element(identifier={:index => 0})
      button_for identifier.clone
    end

    #
    # Finds all buttons that match the provided identifier
    #
    # @param [Hash] identifier how we find all buttons.  You can use a multiple paramaters
    #  by combining of any of the following except xpath. It defaults to an empty
    #  hash which will find all button elements. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :text
    #   * :value
    #   * :xpath
    #   * :src
    #   * :alt
    #   * :css
    #
    def button_elements(identifier={})
      buttons_for identifier.clone
    end

    #
    # Finds a text field
    #
    # @param [Hash] identifier how we find a text field. You can use a multiple parameters
    #  by combining of any of the following except xpath. It defaults to {:index => 0}
    #  which will find the first text field. The valid keys are:
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
    def text_field_element(identifier={:index => 0})
      text_field_for identifier.clone
    end

    #
    # Finds all text fields that match the provided identifier
    #
    # @param [Hash] identifier how we find all text fields. You can use a multiple parameters
    #  by combining of any of the following except xpath. It defaults to empty Hash
    #  which will find all text field elements. The valid keys are:
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
    def text_field_elements(identifier={})
      text_fields_for identifier.clone
    end

    #
    # Finds a hidden field
    #
    # @param [Hash] identifier how we find a hidden field. You can use a multiple parameters
    #  by combining of any of the following except xpath. It defaults to {:index => 0}
    #  which will find the first hidden field. The valid keys are:
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
    def hidden_field_element(identifier={:index => 0})
      hidden_field_for identifier.clone
    end

    #
    # Finds all hidden fields that match the identifier
    #
    # @param [Hash] identifier how we find all hidden fields. You can use a multiple parameters
    #  by combining of any of the following except xpath. It defaults to an empty Hash
    #  which will return all hidden fields. The valid keys are:
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
    def hidden_field_elements(identifier={})
      hidden_fields_for identifier.clone
    end

    #
    # Finds a text area
    #
    # @param [Hash] identifier how we find a text area. You can use a multiple parameters
    #  by combining of any of the following except xpath. It defaults to {:index => 0}
    #  which will find the first text area. The valid keys are:
    #   * :class
    #   * :css
    #   * :id
    #   * :index
    #   * :name
    #   * :tag_name
    #   * :xpath
    #
    def text_area_element(identifier={:index => 0})
      text_area_for identifier.clone
    end

    #
    # Finds all text areas for the provided identifier
    #
    # @param [Hash] identifier how we find all text areas. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all text areas. The valid keys are:
    #   * :class
    #   * :css
    #   * :id
    #   * :index
    #   * :name
    #   * :tag_name
    #   * :xpath
    #
    def text_area_elements(identifier={})
      text_areas_for identifier.clone
    end

    #
    # Finds a select list
    #
    # @param [Hash] identifier how we find a select list. You can use a multiple parameters
    #  by combining of any of the following except xpath. It defaults to {:index => 0}
    #  Which will find the first select list The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :value
    #   * :text
    #
    def select_list_element(identifier={:index => 0})
      select_list_for identifier.clone
    end

    #
    # Finds all select lists for the provided identifier
    #
    # @param [Hash] identifier how we find all select lists. You can use a multiple paramaters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all select lists. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :value
    #   * :text
    #
    def select_list_elements(identifier={})
      select_lists_for identifier.clone
    end

    #
    # Finds a link
    #
    # @param [Hash] identifier how we find a link. You can use a multiple parameters
    #  by combining of any of the following except xpath. It defaults to {:index => 0}
    #  which will find the first link. The valid keys are:
    #   * :class
    #   * :href
    #   * :id
    #   * :index
    #   * :link
    #   * :link_text
    #   * :name
    #   * :xpath
    #   * :text
    #   * :css
    #
    def link_element(identifier={:index => 0})
      link_for identifier.clone
    end

    #
    # Finds all links for the provided identifier
    #
    # @param [Hash] identifier how we find all links. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty hash
    #   which will return all links. The valid keys are:
    #   * :class
    #   * :href
    #   * :id
    #   * :index
    #   * :link
    #   * :link_text
    #   * :name
    #   * :xpath
    #   * :text
    #   * :css
    #
    def link_elements(identifier={})
      links_for identifier.clone
    end

    #
    # Finds a check box
    #
    # @param [Hash] identifier how we find a check box. You can use a multiple parameters
    #  by combining of any of the following except xpath. It defaults to {:index => 0}
    #  which will find the first checkbox. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :value
    #
    def checkbox_element(identifier={:index => 0})
      checkbox_for identifier.clone
    end

    #
    # Finds all checkbox elements for the provided identifier
    #
    # @param [Hash] identifier how we find a checkbox. You can use a multiple parameters
    #  by combining of any of the following except xpath. It defaults to empty Hash
    #  which will return all checkboxes. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :value
    #
    def checkbox_elements(identifier={})
      checkboxes_for identifier.clone
    end

    #
    # Finds a radio button
    #
    # @param [Hash] identifier how we find a radio button. You can use a multiple parameters
    #  by combining of any of the following except xpath. It defaults to {:index => 0}
    #  which will find the first radio button. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def radio_button_element(identifier={:index => 0})
      radio_button_for identifier.clone
    end

    #
    # Finds all radio button elements that match the provided identifier
    #
    # @param [Hash] identifier how we find a radio button. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all radio buttons. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def radio_button_elements(identifier={})
      radio_buttons_for identifier.clone
    end

    #
    # Finds a div
    #
    # @param [Hash] identifier how we find a div. You can use a multiple parameters
    #  by combining of any of the following except xpath. It defaults to {:index => 0}
    #  which will find the first div. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :text
    #
    def div_element(identifier={:index => 0})
      div_for identifier.clone
    end

    #
    # Finds all divs that match the provided identifier
    #
    # @param [Hash] identifier how we find a div. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all divs. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :text
    #
    def div_elements(identifier={})
      divs_for identifier
    end

    #
    # Finds a span
    #
    # @param [Hash] identifier how we find a span. You can use a multiple parameters
    #  by combining of any of the following except xpath. It defaults to {:index => 0}
    #  which will find the first span.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def span_element(identifier={:index => 0})
      span_for identifier.clone
    end

    #
    # Finds all span elements that match the provided identifier
    #
    # @param [Hash] identifier how we find a span. You can use multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all spans.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def span_elements(identifier={})
      spans_for identifier.clone
    end

    #
    # Finds a table
    #
    # @param [Hash] identifier how we find a table. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first table. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def table_element(identifier={:index => 0})
      table_for identifier.clone
    end

    #
    # Finds all tables with match the provided identifier
    #
    # @param [Hash] identifier how we find a table. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all tables. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def table_elements(identifier={})
      tables_for identifier.clone
    end

    #
    # Finds a table cell
    #
    # @param [Hash] identifier how we find a table cell. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first cell. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :text
    #
    def cell_element(identifier={:index => 0})
      cell_for identifier.clone
    end

    #
    # Finds all table cell elements that match the provided identifier
    #
    # @param [Hash] identifier how we find a cell. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all cells. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :text
    #
    def cell_elements(identifier={})
      cells_for identifier.clone
    end

    #
    # Finds an image
    #
    # @param [Hash] identifier how we find an image. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first image. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :alt
    #   * :src
    #
    def image_element(identifier={:index => 0})
      image_for identifier.clone
    end

    #
    # Finds all images that match the provided identifier
    #
    # @param [Hash] identifier how we find an image. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all images. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #   * :alt
    #   * :src
    #
    def image_elements(identifier={})
      images_for identifier.clone
    end

    #
    # Finds a form
    #
    # @param [Hash] identifier how we find a form. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first form. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :action
    #
    def form_element(identifier={:index => 0})
      form_for identifier.clone
    end

    #
    # Finds all forms that match the provided identifier
    #
    # @param [Hash] identifier how we find a form. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all forms. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :action
    #
    def form_elements(identifier={})
      forms_for identifier.clone
    end

    #
    # Finds a list item
    #
    # @param [Hash] identifier how we find a list item. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first list item. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def list_item_element(identifier={:index => 0})
      list_item_for identifier.clone
    end

    #
    # Finds all list items that match the identifier
    #
    # @param [Hash] identifier how we find a list item. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all list items. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def list_item_elements(identifier={})
      list_items_for identifier.clone
    end

    #
    # Finds an ordered list
    #
    # @param [Hash] identifier how we find an ordered list. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first ordered list. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def ordered_list_element(identifier={:index => 0})
      ordered_list_for identifier.clone
    end

    #
    # Finds all ordered lists that match the provided identifier
    #
    # @param [Hash] identifier how we find an ordered list. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all ordered lists. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def ordered_list_elements(identifier={})
      ordered_lists_for identifier.clone
    end

    #
    # Finds an unordered list
    #
    # @param [Hash] identifier how we find an unordered list. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first unordered list. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def unordered_list_element(identifier={:index => 0})
      unordered_list_for identifier.clone
    end

    #
    # Finds all unordered lists that match the provided identifier
    #
    # @param [Hash] identifier how we find an unordered list. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all unordered lists. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def unordered_list_elements(identifier={})
      unordered_lists_for identifier.clone
    end

    #
    # Finds a h1
    #
    # @param [Hash] identifier how we find a h1. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first h1. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h1_element(identifier={:index => 0})
      h1_for identifier.clone
    end

    #
    # Finds all h1 elements that match the provided identifier
    #
    #
    # @param [Hash] identifier how we find a h1. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty hash
    #   which will return all h1s. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h1_elements(identifier={})
      h1s_for identifier.clone
    end

    #
    # Finds a h2
    #
    # @param [Hash] identifier how we find a h2. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first h2. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h2_element(identifier={:index => 0})
      h2_for identifier.clone
    end

    #
    # Finds all h2 elements that match the provided identifier
    #
    #
    # @param [Hash] identifier how we find a h2. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all h2s. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h2_elements(identifier={})
      h2s_for identifier.clone
    end

    #
    # Finds a h3
    #
    # @param [Hash] identifier how we find a h3. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first h3. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h3_element(identifier={:index => 0})
      h3_for identifier.clone
    end

    #
    # Finds all h3 elements that match the provided identifier
    #
    #
    # @param [Hash] identifier how we find a h3. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all h3s. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h3_elements(identifier={})
      h3s_for identifier.clone
    end

    #
    # Finds a h4
    #
    # @param [Hash] identifier how we find a h4. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first h4. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h4_element(identifier={:index => 0})
      h4_for identifier.clone
    end

    #
    # Finds all h4 elements that match the provided identifier
    #
    #
    # @param [Hash] identifier how we find a h4. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all h4s. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h4_elements(identifier={})
      h4s_for identifier.clone
    end

    #
    # Finds a h5
    #
    # @param [Hash] identifier how we find a h5. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first h5. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h5_element(identifier={:index => 0})
      h5_for identifier.clone
    end

    #
    # Finds all h5 elements that match the provided identifier
    #
    #
    # @param [Hash] identifier how we find a h5. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all h5s.  The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h5_elements(identifier={})
      h5s_for identifier.clone
    end

    #
    # Finds a h6
    #
    # @param [Hash] identifier how we find a h6. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to {:index => 0}
    #   which will find the first h6. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h6_element(identifier={:index => 0})
      h6_for identifier.clone
    end

    #
    # Finds all h6 elements that match the provided identifier
    #
    #
    # @param [Hash] identifier how we find a h6. You can use a multiple parameters
    #   by combining of any of the following except xpath. It defaults to empty Hash
    #   which will return all h6s. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def h6_elements(identifier={})
      h6s_for identifier.clone
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
    def paragraph_element(identifier={:index => 0})
      paragraph_for identifier.clone
    end

    #
    # Finds all paragraph elements that match the provided identifier
    #
    # @param [Hash] identifier how we find a paragraph. You can use a multiple parameters
    #  by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :xpath
    #   * :name
    #
    def paragraph_elements identifier
      paragraphs_for identifier.clone
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
    def file_field_element(identifier={:index => 0})
      file_field_for identifier.clone
    end

    #
    # Finds a label
    #
    # @param [Hash] identifier how we find a label. You can use a multiple paramaters
    # by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :text
    #   * :xpath
    #
    def label_element(identifier={:index => 0})
      label_for identifier.clone
    end

    #
    # Finds all labels that match the provided identifier
    #
    # @param [Hash] identifier how we find a label. You can use a multiple paramaters
    # by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :text
    #   * :xpath
    #
    def label_elements(identifier)
      labels_for identifier.clone
    end

    #
    # Finds an element
    #
    # @param [Symbol] the name of the tag for the element
    # @param [Hash] identifier how we find an element. You can use a multiple parameters
    #   by combining of any of the following except xpath. The valid keys are:
    #   * :class
    #   * :id
    #   * :index
    #   * :name
    #   * :xpath
    #
    def element(tag, identifier={:index => 0})
      element_for(tag, identifier.clone)
    end
  end
end
