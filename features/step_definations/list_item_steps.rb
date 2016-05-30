When(/^I get the text from the list item$/) do
  @text = @page.li_id
end

When(/^I locate the list item by "(.*?)"$/) do |how|
  @element = @page.send "li_#{how}_list_item".to_sym
  @text = @element.text
end
