When(/^I retrieve the canvas element$/) do
  @element = @page.canvas_id_element
end

When(/^I search for the canvas by "([^"]*)"$/) do |how|
  @element = @page.send "canvas_#{how}_element"
end
