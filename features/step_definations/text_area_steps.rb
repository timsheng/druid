When(/^I type "(.*?)" into the text area$/) do |text|
  @page.text_area_id = text
end

Then(/^the text area should contain "(.*?)"$/) do |text|
  expect(@page.text_area_id).to eql text
end

When(/^I locate the text area by "(.*?)"$/) do |how|
  @element = @page.send "text_area_#{how}_element".to_sym
end

Then(/^I should be able to type "(.*?)" into the area$/) do |text|
  @element.send_keys text
end

When(/^I search for the text area by "(.*?)" and "(.*?)"$/) do |param1, param2|
  @element = @page.send "text_area_#{param1}_#{param2}_element".to_sym
end

When(/^I retrieve the text area$/) do
  @element = @page.text_area_id_element
end

When(/^I find a text area while the script is executing$/) do
  @text_area = @page.text_area_element(:id => "text_area_id")
end

Then(/^I should be able to type "(.*?)" into the area element$/) do |value|
  @text_area.value = value
end

When(/^I clear the text area$/) do
  @page.text_area_id_element.clear
end
