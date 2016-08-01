module Druid
  module Assist
    def click_link_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Link)
      driver.instance_eval "#{nested_frames(frame_identifiers)}link(identifier).click"
    end

    def link_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Link)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}link(identifier)"
      Druid::Elements::Link.new element
    end

    def text_field_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextField)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}text_field(identifier)"
      Druid::Elements::TextField.new element
    end

    def text_field_value_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextField)
      driver.instance_eval "#{nested_frames(frame_identifiers)}text_field(identifier).value"
    end

    def text_field_value_set identifier, value
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextField)
      driver.instance_eval "#{nested_frames(frame_identifiers)}text_field(identifier).set(value)"
    end

    def check_checkbox identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::CheckBox)
      driver.instance_eval "#{nested_frames(frame_identifiers)}checkbox(identifier).set"
    end

    def uncheck_checkbox identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::CheckBox)
      driver.instance_eval "#{nested_frames(frame_identifiers)}checkbox(identifier).clear"
    end

    def checkbox_checked? identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::CheckBox)
      driver.instance_eval "#{nested_frames(frame_identifiers)}checkbox(identifier).set?"
    end

    def checkbox_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::CheckBox)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}checkbox(identifier)"
      Druid::Elements::CheckBox.new element
    end

    def select_list_value_set identifier, value
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::SelectList)
      driver.instance_eval "#{nested_frames(frame_identifiers)}select_list(identifier).select value"
    end

    def select_list_value_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::SelectList)
      driver.instance_eval "#{nested_frames(frame_identifiers)}select_list(identifier).value"
    end

    def select_list_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::SelectList)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}select_list(identifier)"
      Druid::Elements::SelectList.new element
    end

    def select_radio identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::RadioButton)
      driver.instance_eval "#{nested_frames(frame_identifiers)}radio(identifier).set"
    end

    def clear_radio identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::RadioButton)
      driver.instance_eval "#{nested_frames(frame_identifiers)}radio(identifier).clear"
    end

    def radio_selected? identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::RadioButton)
      driver.instance_eval "#{nested_frames(frame_identifiers)}radio(identifier).set?"
    end

    def radio_button_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::RadioButton)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}radio(identifier)"
      Druid::Elements::RadioButton.new element
    end

    def click_button_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Button)
      driver.instance_eval "#{nested_frames(frame_identifiers)}button(identifier).click"
    end

    def button_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Button)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}button(identifier)"
      Druid::Elements::Button.new element
    end

    def div_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Div, 'div')
      driver.instance_eval "#{nested_frames(frame_identifiers)}div(identifier).text"
    end

    def div_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Div, 'div')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}div(identifier)"
      Druid::Elements::Div.new element
    end

    def table_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Table, 'table')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}table(identifier)"
      Druid::Elements::Table.new element
    end

    def cell_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TableCell, 'td')
      driver.instance_eval "#{nested_frames(frame_identifiers)}td(identifier).text"
    end

    def cell_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TableCell, 'td')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}td(identifier)"
      Druid::Elements::TableCell.new element
    end

    def span_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Span, 'span')
      driver.instance_eval "#{nested_frames(frame_identifiers)}span(identifier).text"
    end

    def span_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Span, 'span')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}span(identifier)"
      Druid::Elements::Span.new element
    end

    def image_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Image)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}image(identifier)"
      Druid::Elements::Image.new element
    end

    def form_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Form)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}form(identifier)"
      Druid::Elements::Form.new element
    end

    def hidden_field_value_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::HiddenField)
      driver.instance_eval "#{nested_frames(frame_identifiers)}hidden(identifier).value"
    end

    def hidden_field_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::HiddenField)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}hidden(identifier)"
      Druid::Elements::HiddenField.new element
    end

    def list_item_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::ListItem, 'li')
      driver.instance_eval "#{nested_frames(frame_identifiers)}li(identifier).text"
    end

    def list_item_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::ListItem, 'li')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}li(identifier)"
      Druid::Elements::ListItem.new element
    end

    def ordered_list_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::OrderedList, 'ol')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}ol(identifier)"
      Druid::Elements::OrderedList.new element
    end

    def text_area_value_set identifier, value
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextArea)
      driver.instance_eval "#{nested_frames(frame_identifiers)}textarea(identifier).send_keys value"
    end

    def text_area_value_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextArea)
      driver.instance_eval "#{nested_frames(frame_identifiers)}textarea(identifier).value"
    end

    def text_area_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::TextArea)
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}textarea(identifier)"
      Druid::Elements::TextArea.new element
    end

    def unordered_list_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::UnOrderedList, 'ul')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}ul(identifier)"
      Druid::Elements::UnOrderedList.new element
    end

    def h1_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h1')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}h1(identifier).text"
    end

    def h1_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h1')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}h1(identifier)"
      Druid::Elements::Heading.new element
    end

    def h2_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h2')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}h2(identifier).text"
    end

    def h2_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h2')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}h2(identifier)"
      Druid::Elements::Heading.new element
    end

    def h3_text_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h3')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}h3(identifier).text"
    end

    def h3_for identifier
      identifier, frame_identifiers = parse_identifiers(identifier, Elements::Heading, 'h3')
      element = driver.instance_eval "#{nested_frames(frame_identifiers)}h3(identifier)"
      Druid::Elements::Heading.new element
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
  end
end
