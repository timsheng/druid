When(/^I get the image element$/) do
  @element = @page.image_id_element
end

Then(/^the image should be "(.*?)" pixels wide$/) do |width|
  expect(@element.width.to_s).to eql width
end

Then(/^the image should be "(.*?)" pixels tall$/) do |height|
  expect(@element.height.to_s).to eql height
end

When(/^I get the image element by "(.*?)"$/) do |how|
  @element = @page.send "image_#{how}_element".to_sym
end

When /^I get the image element bys "([^"]*)" and "([^"]*)"$/ do |param1, param2|
  @element = @page.send "image_#{param1}_#{param2}_element"
end

When(/^I get the image element while the script is executing$/) do
  @element = @page.image_element(:id => 'image_id')
end

Then(/^I should see that the image exists$/) do
  expect(@page.image_id?).to be true
end
