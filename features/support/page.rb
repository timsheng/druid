class Page
  include Druid

  link(:google_search_id, :id => "link_id")
  link(:google_search_name, :name => "link_name")
  link(:google_search_class, :class => "link_class")
  link(:google_search_xpath, :xpath => "//a[text()='Google Search']")
  link(:google_search_href, :href => "success.html")
  link(:google_search_text, :text => "Google Search")
  link(:google_search_index, :index => 0)

  text_field(:text_field_id, :id => "text_field_id")
  text_field(:text_field_class, :class => "text_field_class")
  text_field(:text_field_name, :name => "text_field_name")
  text_field(:text_field_xpath, :xpath => "//input[@type='text']")
  text_field(:text_field_css, :css => "input[type='text']")
  text_field(:text_field_tag_name, :tag_name => "input[type='text']")
  text_field(:text_field_index, :index => 0)

  checkbox(:cb_id, :id => "cb_id")
  checkbox(:cb_name, :name => 'cb_name')
  checkbox(:cb_class, :class => 'cb_class')
  checkbox(:cb_index, :index => 0)
  checkbox(:cb_xpath, :xpath => "//input[@type='checkbox']")

  select_list(:select_list_id, :id => "sel_list_id")
  select_list(:select_list_class, :class => "sel_list_class")
  select_list(:select_list_index, :index => 0)
  select_list(:select_list_name, :name => "sel_list_name")
  select_list(:select_list_xpath, :xpath => "//select")

  radio_button(:milk_id, :id => 'milk_id')
  radio_button(:butter_id, :id => 'butter_id')
  radio_button(:milk_name, :name => 'milk_name')
  radio_button(:milk_class, :class => 'milk_class')
  radio_button(:milk_index, :index => 0)
  radio_button(:milk_xpath, :xpath => "//input[@type='radio']")

  button(:button_id, :id => 'button_id')
  button(:button_name, :name => 'button_name')
  button(:button_class, :class => 'button_class')
  button(:button_index, :index => 0)
  button(:button_xpath, :xpath=> "//input[@type='submit']")
  button(:button_text, :text => 'Click Me')

  div(:div_id, :id => "div_id")
  div(:div_class, :class => 'div_class')
  div(:div_index, :index => 0)
  div(:div_xpath, :xpath => '//div')

  table(:table_id, :id => "table_id")
  table(:table_class, :class => 'table_class')
  table(:table_index, :index => 0)
  table(:table_xpath, :xpath => '//table')

  cell(:cell_id, :id => 'cell_id')
  cell(:cell_class, :class => 'cell_class')
  cell(:cell_index, :index => 3)
  cell(:cell_xpath, :xpath => '//table//tr[2]//td[2]')

  span(:span_id, :id => "span_id")
  span(:span_class, :class => 'span_class')
  span(:span_index, :index => 0)
  span(:span_xpath, :xpath => '//span')

  image(:image_id, :id => "image_id")
  image(:image_name, :name => 'image_name')
  image(:image_class, :class => 'image_class')
  image(:image_index, :index => 0)
  image(:image_xpath, :xpath => '//img')

  form(:form_id, :id => 'form_id')
  form(:form_name, :id => 'form_name')
  form(:form_class, :class => 'form_class')
  form(:form_index, :index => 0)
  form(:form_xpath, :xpath => '//form')

  hidden_field(:hidden_field_id, :id => "hidden_field_id")
  hidden_field(:hidden_field_class, :class => "hidden_field_class")
  hidden_field(:hidden_field_name, :name => "hidden_field_name")
  hidden_field(:hidden_field_xpath, :xpath => "//input[@type='hidden']")
  hidden_field(:hidden_field_css, :css => "input[type='hidden']")
  hidden_field(:hidden_field_tag_name, :tag_name => "input[type='hidden']")
  hidden_field(:hidden_field_index, :index => 0)
  hidden_field(:hidden_field_text, :text => "")
  hidden_field(:hidden_field_value, :value => "")

  list_item(:li_id, :id => 'li_id')
  list_item(:li_class, :class => 'li_class')
  list_item(:li_index, :index => 0)
  list_item(:li_xpath, :xpath => '//li[1]')

end
