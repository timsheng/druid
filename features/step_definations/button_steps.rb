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
  @element = @page.send "button_id_button".to_sym
