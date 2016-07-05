Then(/^the page should contain the text "(.*?)"$/) do |text|
  expect(@page.text).to include text
end

Then(/^the page should contain the html "(.*?)"$/) do |html|
  expect(@page.html).to include html
end

Then(/^the page should have the title "(.*?)"$/) do |title|
  expect(@page.title).to include title
end

Then(/^I am able to go to baidu\.com$/) do
  @page.goto
end

Given(/^I can goto baidu\.com by default$/) do
  @page = Page.new(@driver)
  @page.goto
end

Given(/^I can goto baidu\.com using visit_page without block$/) do
  visit_page(Page)
  # @page = visit_page Page
end

Then(/^the page should have the title "(.*?)" using on_page without block$/) do |text|
  expect(on_page(Page).title).to include text
  # expect(on_page(@page).title).to include text
end

Given(/^I can goto baidu\.com using visit_page with block$/) do
  visit_page(Page) do |page|
    expect(page.title).to include "百度"
  end
  # @page = visit_page Page do |page|
  #   expect(page.title).to include "百度"
  # end
end

Then(/^the page should have the title "(.*?)" using on_page with block$/) do |text|
  on_page(Page) do |page|
    expect(page.title).to include text
  end
  # on_page(@page) do |page|
  #   expect(page.title).to include text
  # end
end

Then(/^I should be able to wait for a block to return true$/) do
  @page.google_search_id
  @page.wait_until(10, "too long to display page") do
    @page.text.include? 'Success'
  end
end

When(/^I handle the alert$/) do
  @msg = @page.alert do
    @page.alert_button
  end
end

Then(/^I should be able to get the alert's message$/) do
  expect(@msg).to eql "I am an alert"
end

When(/^I handle the confirm$/) do
  @msg = @page.confirm(true) do
    @page.confirm_button
  end
end

Then(/^I should be able to get the confirm's message$/) do
  expect(@msg).to eql "set the value"
end

When(/^I handle the prompt$/) do
  @msg = @page.prompt("Tim") do
    @page.prompt_button
  end
end

Then(/^I should be able to get the message and default value$/) do
  expect(@msg).to eql "enter your name"
end

When(/^I open a second window$/) do
  @page.open_window
end

class SecondPage
  include Druid
end

Then(/^I should be able to attach to page object using title$/) do
  @second_page = SecondPage.new(@driver)
  @second_page.attach_to_window(:title => "Success")
end

Then(/^I should be able to attach to page object using url$/) do
  @second_page = SecondPage.new(@driver)
  @second_page.attach_to_window(:url => "success.html")
end

Then(/^I should be able to attach to page object using index$/) do
  @second_page = SecondPage.new(@driver)
  @second_page.attach_to_window(:index => 1)
end

Then(/^I should be able to refresh the page$/) do
  @page.refresh
end

When(/^I press the back button$/) do
  @page.back
end

When(/^I press the forward button$/) do
  @page.forward
end
