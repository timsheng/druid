When(/^I click the button$/) do
  @page.button_id
end

Then(/^I should be on the success page$/) do
  expect(@page.text).to include 'Success'
  expect(@page.title).to eql 'Success'
end

When(/^I locate the button by "(.*?)"$/) do |how|
  @how = how
end

Then(/^I should be able to click the button$/) do
  @page.send "button_#{@how}".to_sym
end

When(/^I retrieve a button element$/) do
  @element = @page.send "button_id_element".to_sym
end

When(/^I search for the button by "(.*?)" and "(.*?)"$/) do |param1, param2|
  @how = "#{param1}_#{param2}"
end

When(/^I find a button while the script is executing$/) do
  @button = @page.button_element(:id => 'button_id')
end

Then(/^I should be able to click the button element$/) do
  @button.click
end

Then(/^I should be able to click the real button$/) do
  @page.send "btn_#{@how}".to_sym
end

When(/^I click the button with type image$/) do
  @page.button_image_id
end

When(/^I click the image button using src$/) do
  @page.button_image_src
end
