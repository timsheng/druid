When(/^I type "(.*?)" into the text area$/) do |text|
  @page.text_area_id = text
end

Then(/^the text area should contain "(.*?)"$/) do |text|
  expect(@page.text_area_id).to eql text
end

When(/^I locate the text area by "(.*?)"$/) do |how|
  @element = @page.send "text_area_#{how}_text_area".to_sym
end

Then(/^I should be able to type "(.*?)" into the area$/) do |text|
  @element.send_keys text
end
