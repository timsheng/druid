When(/^I select the "(.*?)" radio button$/) do |name|
  @page.send "select_#{name.downcase}_id".to_sym
end

Then(/^the "(.*?)" radio button should be selected$/) do |name|
  expect(@page.send "#{name.downcase}_id_selected?".to_sym).to be true
end

When(/^I locate the radio button by "(.*?)"$/) do |how|
  @how = how
end

When(/^I select the radio button$/) do
  @page.send "select_milk_#{@how}".to_sym
end

When(/^I retrieve a radio button$/) do
  @element = @page.milk_id_element
end

When(/^I search for the radio button by "(.*?)" and "(.*?)"$/) do |param1, param2|
  @how = "#{param1}_#{param2}"
end

When(/^I select the radio button while the script is executing$/) do
  @page.radio_button_element(:id => "milk_id").select
end

Then(/^I should see that the radio button exists$/) do
  expect(@page.milk_id?).to be true
end
