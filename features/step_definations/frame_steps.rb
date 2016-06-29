class FramePage
  include Druid
end

Given(/^I am on the frame elements page$/) do
  @page = FramePage.new(@driver)
  @page.navigate_to(UrlHelper.frame_elements)
end

When(/^I switch to a frame using id "(.*?)"$/) do |id|
  @page.switch_to_frame(id)
end

Then(/^I should see "(.*?)" in the frame$/) do |text|
  expect(@page.text).to include text
end

When(/^I switch to a frame using index "(.*?)"$/) do |index|
  @page.switch_to_frame(index.to_i)
end
