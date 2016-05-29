When(/^I get the text from the div$/) do
  @div_text = @page.div_id
end

Then(/^the text should be "(.*?)"$/) do |expected_text|
  expect(@div_text).to eql expected_text
end

When(/^I locate the div by "(.*?)"$/) do |how|
  @div_text = @page.send "div_#{how}".to_sym
end

When(/^I retrieve the div element$/) do
  @element = @page.div_id_div
end
