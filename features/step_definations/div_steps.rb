When(/^I get the text from the div$/) do
  @text = @page.div_id
end

Then(/^the text should be "(.*?)"$/) do |expected_text|
  expect(@text.tr("\n", ' ')).to eql expected_text
end

When(/^I locate the div by "(.*?)"$/) do |how|
  @text = @page.send "div_#{how}".to_sym
end

When(/^I retrieve the div element$/) do
  @element = @page.div_id_element
end

When(/^I search for the div by "(.*?)" and "(.*?)"$/) do |param1, param2|
  @text = @page.send "div_#{param1}_#{param2}".to_sym
end


When(/^I get the text from a div while the script is executing$/) do
  @text = @page.div_element(:id => 'div_id').text
end

Then(/^I should see that the div exists$/) do
  expect(@page.div_id?).to be true
end
