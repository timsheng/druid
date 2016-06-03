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

Then(/^the list should contain (\d+) items$/) do |items|
  expect(@list.items).to eql items.to_i
end

Then(/^each item should contain "(.*?)"$/) do |text|
  @list.each do |item|
    expect(item.text).to include text
  end
end

When(/^I search for the ordered list by "(.*?)" and "(.*?)"$/) do |param1, param2|
  @list = @page.send "ol_#{param1}_#{param2}_ordered_list"
end

Then(/^the list items text should be "(.*?)"$/) do |expected_text|
  expect(@element.text).to eql expected_text
end
