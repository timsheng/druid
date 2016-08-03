module Druid
  module Assist
    def click_link_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Link)
      driver.instance_eval "#{nested_frames(frame_identifiers)}link(identifier).click"
      switch_to_default_content(frame_identifiers)
    end

    def link_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Link)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}link(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Link.new element
    end

    def text_field_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextField)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}text_field(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::TextField.new element
    end

    def text_field_value_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextField)
      value = driver.instance_eval "#{nested_frames(frame_identifiers)}text_field(identifier).value"
      switch_to_default_content(frame_identifiers)
      value
    end

    def text_field_value_set identifier, value
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextField)
      driver.instance_eval "#{nested_frames(frame_identifiers)}text_field(identifier).set(value)"
      switch_to_default_content(frame_identifiers)
    end

    def check_checkbox identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::CheckBox)
      driver.instance_eval "#{nested_frames(frame_identifiers)}checkbox(identifier).set"
      switch_to_default_content(frame_identifiers)
    end

    def uncheck_checkbox identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::CheckBox)
      driver.instance_eval "#{nested_frames(frame_identifiers)}checkbox(identifier).clear"
      switch_to_default_content(frame_identifiers)
    end

    def checkbox_checked? identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::CheckBox)
      result = driver.instance_eval "#{nested_frames(frame_identifiers)}checkbox(identifier).set?"
      switch_to_default_content(frame_identifiers)
      result
    end

    def checkbox_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::CheckBox)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}checkbox(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::CheckBox.new element
    end

    def select_list_value_set identifier, value
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::SelectList)
      driver.instance_eval "#{nested_frames(frame_identifiers)}select_list(identifier).select value"
      switch_to_default_content(frame_identifiers)
    end

    def select_list_value_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::SelectList)
      value = driver.instance_eval "#{nested_frames(frame_identifiers)}select_list(identifier).value"
      switch_to_default_content(frame_identifiers)
      value
    end

    def select_list_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::SelectList)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}select_list(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::SelectList.new element
    end

    def select_radio identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::RadioButton)
      driver.instance_eval "#{nested_frames(frame_identifiers)}radio(identifier).set"
      switch_to_default_content(frame_identifiers)
    end

    def clear_radio identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::RadioButton)
      driver.instance_eval "#{nested_frames(frame_identifiers)}radio(identifier).clear"
      switch_to_default_content(frame_identifiers)
    end

    def radio_selected? identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::RadioButton)
      result = driver.instance_eval "#{nested_frames(frame_identifiers)}radio(identifier).set?"
      switch_to_default_content(frame_identifiers)
      result
    end

    def radio_button_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::RadioButton)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}radio(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::RadioButton.new element
    end

    def click_button_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Button)
      driver.instance_eval "#{nested_frames(frame_identifiers)}button(identifier).click"
      switch_to_default_content(frame_identifiers)
    end

    def button_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Button)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}button(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Button.new element
    end

    def div_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Div, 'div')
      text = driver.instance_eval "#{nested_frames(frame_identifiers)}div(identifier).text"
      switch_to_default_content(frame_identifiers)
      text
    end

    def div_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Div, 'div')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}div(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Div.new element
    end

    def table_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Table, 'table')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}table(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Table.new element
    end

    def cell_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TableCell, 'td')
      text = driver.instance_eval "#{nested_frames(frame_identifiers)}td(identifier).text"
      switch_to_default_content(frame_identifiers)
      text
    end

    def cell_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TableCell, 'td')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}td(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::TableCell.new element
    end

    def span_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Span, 'span')
      text = driver.instance_eval "#{nested_frames(frame_identifiers)}span(identifier).text"
      switch_to_default_content(frame_identifiers)
      text
    end

    def span_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Span, 'span')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}span(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Span.new element
    end

    def image_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Image)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}image(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Image.new element
    end

    def form_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Form)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}form(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Form.new element
    end

    def hidden_field_value_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::HiddenField)
      value = driver.instance_eval "#{nested_frames(frame_identifiers)}hidden(identifier).value"
      switch_to_default_content(frame_identifiers)
      value
    end

    def hidden_field_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::HiddenField)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}hidden(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::HiddenField.new element
    end

    def list_item_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::ListItem, 'li')
      text = driver.instance_eval "#{nested_frames(frame_identifiers)}li(identifier).text"
      switch_to_default_content(frame_identifiers)
      text
    end

    def list_item_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::ListItem, 'li')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}li(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::ListItem.new element
    end

    def ordered_list_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::OrderedList, 'ol')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}ol(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::OrderedList.new element
    end

    def text_area_value_set identifier, value
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextArea)
      driver.instance_eval "#{nested_frames(frame_identifiers)}textarea(identifier).send_keys value"
      switch_to_default_content(frame_identifiers)
    end

    def text_area_value_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextArea)
      value = driver.instance_eval "#{nested_frames(frame_identifiers)}textarea(identifier).value"
      switch_to_default_content(frame_identifiers)
      value
    end

    def text_area_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextArea)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}textarea(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::TextArea.new element
    end

    def unordered_list_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::UnOrderedList, 'ul')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}ul(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::UnOrderedList.new element
    end

    def h1_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h1')
      text = driver.instance_eval "#{nested_frames(frame_identifiers)}h1(identifier).text"
      switch_to_default_content(frame_identifiers)
      text
    end

    def h1_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h1')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}h1(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Heading.new element
    end

    def h2_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h2')
      text = driver.instance_eval "#{nested_frames(frame_identifiers)}h2(identifier).text"
      switch_to_default_content(frame_identifiers)
      text
    end

    def h2_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h2')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}h2(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Heading.new element
    end

    def h3_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h3')
      text = driver.instance_eval "#{nested_frames(frame_identifiers)}h3(identifier).text"
      switch_to_default_content(frame_identifiers)
      text
    end

    def h3_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h3')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}h3(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Heading.new element
    end

    def h4_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h4')
      text = driver.instance_eval "#{nested_frames(frame_identifiers)}h4(identifier).text"
      switch_to_default_content(frame_identifiers)
      text
    end

    def h4_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h4')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}h4(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Heading.new element
    end

    def h5_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h5')
      text = driver.instance_eval "#{nested_frames(frame_identifiers)}h5(identifier).text"
      switch_to_default_content(frame_identifiers)
      text
    end

    def h5_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h5')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}h5(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Heading.new element
    end

    def h6_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h6')
      text = driver.instance_eval "#{nested_frames(frame_identifiers)}h6(identifier).text"
      switch_to_default_content(frame_identifiers)
      text
    end

    def h6_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h6')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}h6(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Heading.new element
    end

    def paragraph_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Paragraph, 'p')
      text = driver.instance_eval "#{nested_frames(frame_identifiers)}p(identifier).text"
      switch_to_default_content(frame_identifiers)
      text
    end

    def paragraph_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Paragraph, 'p')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}p(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::Paragraph.new element
    end

    def file_field_value_set identifier, value
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::FileField)
      driver.instance_eval "#{nested_frames(frame_identifiers)}file_field(identifier).set(value)"
      switch_to_default_content(frame_identifiers)
    end

    def file_field_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::FileField)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}file_field(identifier)"
      switch_to_default_content(frame_identifiers)
      Elements::FileField.new element
    end
    private

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
