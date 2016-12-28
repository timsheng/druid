module Druid
  module Assist
    def click_link_for identifier
      process_call("link(identifier).click if identifier", Elements::Link, identifier)
    end

    def link_for identifier
      find_element("link(identifier)", Elements::Link, identifier)
    end

    #
    # retrieve all link elements
    #
    def links_for identifier
      find_elements("links(identifier)", Elements::Link, identifier)
    end

    def text_field_for identifier
      find_element("text_field(identifier)", Elements::TextField, identifier)
    end

    #
    # retrieve an array of hidden field elements
    #
    def text_fields_for(identifier)
      elements = find_elements("text_fields(identifier)", Elements::TextField, identifier)
      elements.select {|e| e.element.tag_name == "input"}
    end

    def text_field_value_for identifier
      process_call("text_field(identifier).value", Elements::TextField, identifier)
    end

    def text_field_value_set identifier, value
      process_call("text_field(identifier).set(value)", Elements::TextField, identifier, value)
    end

    def check_checkbox identifier
      process_call("checkbox(identifier).set", Elements::CheckBox, identifier)
    end

    def uncheck_checkbox identifier
      process_call("checkbox(identifier).clear", Elements::CheckBox, identifier)
    end

    def checkbox_checked? identifier
      process_call("checkbox(identifier).set?", Elements::CheckBox, identifier)
    end

    def checkbox_for identifier
      find_element("checkbox(identifier)", Elements::CheckBox, identifier)
    end

    #
    # retrieve an array of checkbox elements

    def checkboxes_for identifier
      find_elements("checkboxes(identifier)", Elements::CheckBox, identifier)
    end

    def select_list_value_set identifier, value
      process_call("select_list(identifier).select(value)", Elements::SelectList, identifier, value)
    end

    def select_list_value_for identifier
      process_call("select_list(identifier).options.each {|o| return o.text if o.selected?}", Elements::SelectList, identifier)
    end

    def select_list_for identifier
      find_element("select_list(identifier)", Elements::SelectList, identifier)
    end

    #
    # retrieve an array of select_list elements
    #
    def select_lists_for identifier
      find_elements("select_lists(identifier)", Elements::SelectList, identifier)
    end

    def select_radio identifier
      process_call("radio(identifier).set", Elements::RadioButton, identifier)
    end

    def clear_radio identifier
      process_call("radio(identifier).clear", Elements::RadioButton, identifier)
    end

    def radio_selected? identifier
      process_call("radio(identifier).set?", Elements::RadioButton, identifier)
    end

    def radio_button_for identifier
      find_element("radio(identifier)", Elements::RadioButton, identifier)
    end

    #
    # retrieve an array of radio button elements
    def radio_buttons_for identifier
      find_elements("radios(identifier)", Elements::RadioButton, identifier)
    end

    def click_button_for identifier
      process_call("button(identifier).click", Elements::Button, identifier)
    end

    def button_for identifier
      find_element("button(identifier)", Elements::Button, identifier)
    end

    #
    # retrieve an array of button elements
    #
    def buttons_for(identifier)
      find_elements("buttons(identifier)", Elements::Button, identifier)
    end

    def div_text_for identifier
      process_call("div(identifier).text", Elements::Div, identifier, nil, 'div')
    end

    def div_for identifier
      find_element("div(identifier)", Elements::Div, identifier, 'div')
    end

    #
    # retrieve an array of div elements
    #
    def divs_for identifier
      find_elements("divs(identifier)", Elements::Div, identifier, 'div')
    end

    def table_for identifier
      find_element("table(identifier)", Elements::Table, identifier, 'table')
    end

    #
    # retrieve an array of table elements
    #
    def tables_for identifier
      find_elements("tables(identifier)", Elements::Table, identifier, 'table')
    end

    def cell_text_for identifier
      process_call("td(identifier).text", Elements::TableCell, identifier, nil, 'td')
    end

    def cell_for identifier
      find_element("td(identifier)", Elements::TableCell, identifier, 'td')
    end

    #
    # retrieve an array of cell elements
    #
    def cells_for identifier
      find_elements("tds(identifier)", Elements::TableCell, identifier, 'td')
    end

    def span_text_for identifier
      process_call("span(identifier).text", Elements::Span, identifier, nil, 'span')
    end

    def span_for identifier
      find_element("span(identifier)", Elements::Span, identifier, 'span')
    end

    #
    # retrieve an array of span elements
    #
    def spans_for identifier
      find_elements("spans(identifier)", Elements::Span, identifier, 'span')
    end

    def image_for identifier
      find_element("image(identifier)", Elements::Image, identifier)
    end

    #
    # retrieve an array of image elements
    #
    def images_for identifier
      find_elements("images(identifier)", Elements::Image, identifier)
    end

    def form_for identifier
      find_element("form(identifier)", Elements::Form, identifier)
    end

    #
    # retrieve an array of form elements
    #
    def forms_for identifier
      find_elements("forms(identifier)", Elements::Form, identifier)
    end

    def hidden_field_value_for identifier
      process_call("hidden(identifier).value", Elements::HiddenField, identifier)
    end

    def hidden_field_for identifier
      find_element("hidden(identifier)", Elements::HiddenField, identifier)
    end

    #
    # retrieve an array of hidden_field elements
    #
    def hidden_fields_for identifier
      find_elements("hiddens(identifier)", Elements::HiddenField, identifier)
    end

    def list_item_text_for identifier
      process_call("li(identifier).text", Elements::ListItem, identifier, nil, 'li')
    end

    def list_item_for identifier
      find_element("li(identifier)", Elements::ListItem, identifier, 'li')
    end

    #
    # retrieve an array of list_item elements
    #
    def list_items_for identifier
      find_elements("lis(identifier)", Elements::ListItem, identifier, 'li')
    end

    def ordered_list_for identifier
      find_element("ol(identifier)", Elements::OrderedList, identifier, 'ol')
    end

    #
    # retrieve an array of ordered_list elements
    #
    def ordered_lists_for identifier
      find_elements("ols(identifier)", Elements::OrderedList, identifier, 'ol')
    end

    def text_area_value_set identifier, value
      process_call("textarea(identifier).set(value)", Elements::TextArea, identifier, value)
    end

    def text_area_value_for identifier
      process_call("textarea(identifier).value", Elements::TextArea, identifier)
    end

    def text_area_for identifier
      find_element("textarea(identifier)", Elements::TextArea, identifier)
    end
    #
    # retrieve an array of textarea elements
    def text_areas_for identifier
      find_elements("textareas(identifier)", Elements::TextArea, identifier)
    end

    def unordered_list_for identifier
      find_element("ul(identifier)", Elements::UnOrderedList, identifier, 'ul')
    end

    #
    # retrieve an array of unordered_lists elements
    #
    def unordered_lists_for identifier
      find_elements("uls(identifier)", Elements::UnOrderedList, identifier, 'ul')
    end

    def h1_text_for identifier
      process_call("h1(identifier).text", Elements::Heading, identifier, nil, 'h1')
    end

    def h1_for identifier
      find_element("h1(identifier)", Elements::Heading, identifier, 'h1')
    end

    #
    # retrieve an array of h1 elements
    #
    def h1s_for identifier
      find_elements("h1s(identifier)", Elements::Heading, identifier, 'h1')
    end

    def h2_text_for identifier
      process_call("h2(identifier).text", Elements::Heading, identifier, nil, 'h2')
    end

    def h2_for identifier
      find_element("h2(identifier)", Elements::Heading, identifier, 'h2')
    end

    #
    # retrieve an array of h2 elements
    #
    def h2s_for identifier
      find_elements("h2s(identifier)", Elements::Heading, identifier, 'h2')
    end

    def h3_text_for identifier
      process_call("h3(identifier).text", Elements::Heading, identifier, nil, 'h3')
    end

    def h3_for identifier
      find_element("h3(identifier)", Elements::Heading, identifier, 'h3')
    end

    #
    # retrieve an array of h3 elements
    #
    def h3s_for identifier
      find_elements("h3s(identifier)", Elements::Heading, identifier, 'h3')
    end

    def h4_text_for identifier
      process_call("h4(identifier).text", Elements::Heading, identifier, nil, 'h4')
    end

    def h4_for identifier
      find_element("h4(identifier)", Elements::Heading, identifier, 'h4')
    end

    #
    # retrieve an array of h4 elements
    #
    def h4s_for identifier
      find_elements("h4s(identifier)", Elements::Heading, identifier, 'h4')
    end

    def h5_text_for identifier
      process_call("h5(identifier).text", Elements::Heading, identifier, nil, 'h5')
    end

    def h5_for identifier
      find_element("h5(identifier)", Elements::Heading, identifier, 'h5')
    end

    #
    # retrieve an array of h5 elements
    #
    def h5s_for identifier
      find_elements("h5s(identifier)", Elements::Heading, identifier, 'h5')
    end

    def h6_text_for identifier
      process_call("h6(identifier).text", Elements::Heading, identifier, nil, 'h6')
    end

    def h6_for identifier
      find_element("h6(identifier)", Elements::Heading, identifier, 'h6')
    end

    #
    # retrieve an array of h6 elements
    #
    def h6s_for identifier
      find_elements("h6s(identifier)", Elements::Heading, identifier, 'h6')
    end

    def paragraph_text_for identifier
      process_call("p(identifier).text", Elements::Paragraph, identifier, nil, 'p')
    end

    def paragraph_for identifier
      find_element("p(identifier)", Elements::Paragraph, identifier, 'p')
    end

    #
    # retrieve an array of paragraph Elements
    #
    def paragraphs_for identifier
      find_elements("ps(identifier)", Elements::Paragraph, identifier, 'p')
    end

    def file_field_value_set identifier, value
      process_call("file_field(identifier).set(value)", Elements::FileField, identifier, value)
    end

    def file_field_for identifier
      find_element("file_field(identifier)", Elements::FileField, identifier)
    end

    #
    # retrieve an array of file field elements
    #
    def file_fields_for identifier
      find_elements("file_fields(identifier)", Elements::FileField, identifier)
    end

    #
    # method to return the text for a label
    #
    def label_text_for(identifier)
      process_call("label(identifier).text", Elements::Label, identifier, nil, 'label')
    end

    #
    # method to return a Druid::Elements::Label element
    #
    def label_for(identifier)
      find_element("label(identifier)", Elements::Label, identifier, 'label')
    end

    #
    # method to retrieve an array of label elements
    #
    def labels_for(identifier)
      find_elements("labels(identifier)", Elements::Label, identifier, 'p')
    end

    #
    # method to click on an area
    #
    def click_area_for(identifier)
      process_call("area(identifier).click", Elements::Area, identifier, nil, 'area')
    end

    #
    # method to retrieve an area element
    #
    def area_for(identifier)
      find_element("area(identifier)", Elements::Area, identifier, 'area')
    end

    #
    # method to retrieve an array of area elements
    #
    def areas_for(identifier)
      find_elements("areas(identifier)", Elements::Area, identifier, 'area')
    end

    def element_for(tag, identifier)
      find_element("#{tag.to_s}(identifier)", Elements::Element, identifier, tag.to_s)
    end

    private

    def find_elements(the_call, type, identifier, tag_name=nil)
      identifier, frame_identifiers = parse_identifiers(identifier, type, tag_name)
      elements = driver.instance_eval "#{nested_frames(frame_identifiers)}#{the_call}"
      switch_to_default_content(frame_identifiers)
      elements.map { |element| type.new(element) }
    end

    def find_element(the_call, type, identifier, tag_name=nil)
      identifier, frame_identifiers = parse_identifiers(identifier, type, tag_name)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}#{the_call}"
      switch_to_default_content(frame_identifiers)
      type.new(element)
    end

    def process_call(the_call, type, identifier, value=nil, tag_name=nil)
      identifier, frame_identifiers = parse_identifiers(identifier, type, tag_name)
      value = driver.instance_eval "#{nested_frames(frame_identifiers)}#{the_call}"
      switch_to_default_content(frame_identifiers)
      value
    end

    def add_tagname_if_needed identifier, tag
      return identifier if identifier.length < 2 and not identifier[:name]
      identifier[:tag_name] = tag if identifier[:name]
      identifier
    end

    def parse_identifiers(identifier, element, tag_name=nil)
      frame_identifiers = identifier.delete(:frame)
      identifier = add_tagname_if_needed identifier, tag_name if tag_name
      identifier = element.identifier_for identifier
      return identifier, frame_identifiers
    end

    def nested_frames(frame_identifiers)
      return if frame_identifiers.nil?
      frame_str = ''
      frame_identifiers.each do |frame|
        type = frame.keys.first
        identifier = frame.values.first.map do |key, value|
          if value.is_a?(Regexp)
            ":#{key} => #{value.inspect}"
          elsif value.to_s.is_integer
            ":#{key} => #{value}"
          else
            ":#{key} => '#{value}'"
          end
        end.join(', ')
        frame_str +="#{type.to_s}(#{identifier})."
      end
      frame_str
    end

    def switch_to_default_content(frame_identifiers)
      driver.wd.switch_to.default_content unless frame_identifiers.nil?
    end
  end
end
