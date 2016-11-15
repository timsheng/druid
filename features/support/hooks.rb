Before do
  @driver = Druid::PersistantBrowser.get_browser
end

at_exit do
  Druid::PersistantBrowser.quit
end
