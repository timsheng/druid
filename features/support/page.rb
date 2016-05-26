class Page
  include Druid

  link(:google_search_id, :id => "link_id")
  link(:google_search_name, :name => "link_name")
  link(:google_search_class, :class => "link_class")
  link(:google_search_xpath, :xpath => "//a[text()='Google Search']")
  # link(:google_search_link, :link => "Google Search")
  # link(:google_search_link_text, :link_text => "Google Search")
  link(:google_search_href, :href => "http://www.google.com")
  link(:google_search_text, :text => "Google Search")
  link(:google_search_index, :index => 0)

end
