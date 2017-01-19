Then(/^I should see that the radio button group exists$/) do
  expect(@page.favorite_cheese?).to be true
end

Then(/^no radio buttons should be selected in the group$/) do
  expect(@page.favorite_cheese_selected?).to be false
end

When(/^I select the "([^"]*)" radio button in the group$/) do |how|
  @page.select_favorite_cheese("#{how}")
end

Then(/^the "([^"]*)" radio button should be selected in the group$/) do |how|
  expect(@page.favorite_cheese_selected?).to eql how
end

Then(/^the "([^"]*)" radio button should not be selected$/) do |how|
  expect(@page.favorite_cheese_selected?).not_to eql how
end

When(/^I ask for the elements of a radio button group$/) do
  @elements = @page.favorite_cheese_elements
end

Then(/^I should have an array with elements for each radio button$/) do
  expect(@elements.length).to eql 3
end

Then(/^the radio button element values should be "([^"]*)", "([^"]*)", "([^"]*)"$/) do |val1, val2, val3|
  expect(@page.favorite_cheese_values).to eql [val1, val2, val3]

end
