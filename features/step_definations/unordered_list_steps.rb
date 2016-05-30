When(/^I get the first item from the unordered list$/) do
  @element = @page.ul_id_unordered_list[0]
end

When(/^I locate the unordered list by "(.*?)"$/) do |how|
  @list = @page.send "ul_#{how}_unordered_list".to_sym
end
