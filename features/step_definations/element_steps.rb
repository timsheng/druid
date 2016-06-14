Then(/^I should know its' text is "(.*?)"$/) do |text|
  expect(@element.text).to eql text
end

Then(/^I should know it is equal to itself$/) do
  expect(@element==@element).to be true
end

Then(/^I should know its' tag name is "(.*?)"$/) do |tagname|
  expect(@element.tag_name).to eql tagname
end

Then(/^I should know the attribute "(.*?)" is false$/) do |attr_name|
  @attr = @element.attribute(attr_name)
  # expect(@attr.is_a? NilClass).to be true
  expect(@attr).to be_nil
end

Then(/^I should be able to click it$/) do
  @element.click
end

Then(/^I should know its' value is "(.*?)"$/) do |value|
  expect(@element.value).to eql value
end

Then(/^I should know its' text includes "(.*?)"$/) do |text|
  expect(@element.text).to include text
end

Then(/^I should know it is not visible$/) do
  expect(@element).not_to be_visible
end
