Given /^I am on the static elements page$/ do
  @page = Page.new(@driver)
  @page.navigate_to(UrlHelper.static_elements)
end
