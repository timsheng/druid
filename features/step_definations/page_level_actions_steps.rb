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
