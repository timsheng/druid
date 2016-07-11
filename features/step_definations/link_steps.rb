When(/^I select the link labeled "(.*?)"$/) do |text|
  @page.google_search_id_element
  @page.google_search_id
end

When(/^I locate the link by "(.*?)"$/) do |how|
  @how = how
end

Then(/^I should be able to select the link$/) do
  @page.send "google_search_#{@how}_element".to_sym
  @page.send "google_search_#{@how}".to_sym
end

When(/^I retrieve a link element$/) do
  @element = @page.google_search_id_element
end

Then(/^I should know it exists$/) do
  expect(@element.exist?).to be true
end

Then(/^I should know it is visible$/) do
  expect(@element.visible?).to be true
end

When(/^I select a link labeled "(.*?)" and index "(.*?)"$/) do |label, index|
  @page.send "#{label.downcase}#{index}".to_sym
end

When(/^I select a link while the script is executing$/) do
  link = @page.link_element(:id => 'link_id')
  link.click
end
