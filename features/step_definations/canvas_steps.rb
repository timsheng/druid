When(/^I retrieve the canvas element$/) do
  @element = @page.canvas_id_element
end

When(/^I search for the canvas by "([^"]*)"$/) do |how|
  @element = @page.send "canvas_#{how}_element"
end

Then(/^I should see that the canvas width is "([^"]*)"$/) do |width|
  expect(@element.width).to eql width.to_i
end

Then(/^I should see that the canvas height is "([^"]*)"$/) do |height|
  expect(@element.height).to eql height.to_i
end
