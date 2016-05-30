When(/^I get the first item from the ordered list$/) do
  @element = @page.ol_id_ordered_list[0]
end

Then(/^the list item's text should be "(.*?)"$/) do |text|
  expect(@element.text).to eql text
end

When(/^I locate the ordered list by "(.*?)"$/) do |how|
  @list = @page.send "ol_#{how}_ordered_list"
end

When(/^I get the first item from the list$/) do
  @element = @list[0]
end
