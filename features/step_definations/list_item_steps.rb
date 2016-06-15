When(/^I get the text from the list item$/) do
  @text = @page.li_id
end

When(/^I locate the list item by "(.*?)"$/) do |how|
  @element = @page.send "li_#{how}_list_item".to_sym
  @text = @element.text
end

When(/^I search for the list item by "(.*?)" and "(.*?)"$/) do |param1, param2|
  @text = @page.send "li_#{param1}_#{param2}"
end

When(/^I retrieve a list item element$/) do
  @element = @page.li_id_list_item
end
